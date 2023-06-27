// Función para cambiar de pestaña
function openTab(event, tabId) {
  // Obtener todos los elementos con la clase "tab-content"
  var tabContents = document.getElementsByClassName("tab-content");
  
  // Ocultar todos los elementos con la clase "tab-content"
  for (var i = 0; i < tabContents.length; i++) {
    tabContents[i].style.display = "none";
  }
  
  // Obtener todos los elementos con la clase "tab"
  var tabs = document.getElementsByClassName("tab");
  
  // Remover la clase "active" de todos los elementos con la clase "tab"
  for (var i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace(" active", "");
  }
  
  // Mostrar el contenido de la pestaña seleccionada
  document.getElementById(tabId).style.display = "block";
  
  // Agregar la clase "active" al botón de la pestaña seleccionada
  event.currentTarget.className += " active";
}

// Abrir la primera pestaña por defecto
document.getElementById("tab1").style.display = "block";
document.getElementsByClassName("tab")[0].className += " active";


var slideIndex = 1;
showSlide(slideIndex);

// Función para cambiar de slide
function changeSlide(n) {
  showSlide(slideIndex += n);
}

// Función para mostrar el slide actual
function showSlide(n) {
  var slides = document.getElementsByClassName("slide");
  
  // Verificar límites del slide
  if (n > slides.length) {
    slideIndex = 1;
  } else if (n < 1) {
    slideIndex = slides.length;
  }
  
  // Ocultar todos los slides
  for (var i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  
  // Mostrar el slide actual
  slides[slideIndex - 1].style.display = "block";
}



////////////////////////////consulta de la api

const id = 9;
var graphData = { nodes: [], links: [] };
const librosAgregados = new Set();

var fetchPromises = [];

for (let i = 1; i <= id; i++) {
  const fetchPromise = fetch('http://localhost/filosofia/omp/index.php/pf/api/v1/submissions/' + i + '/publications/' + i)
    .then(response => response.json())
    .then(data => {
      const authors = data.authorsString;
      const libros = data.fullTitle.es_ES;
      const edil = data.copyrightHolder.es_ES;
      const fecha = data.datePublished;
      
      if (authors !== null && libros !== null && edil !== null && fecha !== null && !librosAgregados.has(libros)) {
        librosAgregados.add(libros);
        graphData.nodes.push({ id: libros, message: authors, Editorial: edil, DATE: fecha });
      }
    })
    .catch(error => {
      console.error('Error fetching data:', error);
    });

  fetchPromises.push(fetchPromise);
}

Promise.all(fetchPromises)
  .then(() => {
    console.log(graphData);
    createForceDirectedGraph(graphData);
  });

// Crear el gráfico force-directed con los datos
function createForceDirectedGraph(data) {
  // Configurar el tamaño del contenedor del gráfico
  var width = 600;
  var height = 150;

  // Crear el contenedor SVG
  var svg = d3.select("#grafico")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  // Crear la simulación de fuerza
  var simulation = d3.forceSimulation(data.nodes)
    .force("charge", d3.forceManyBody().strength(-0.3))
    .force("center", d3.forceCenter(300, 80))
    .force("link", d3.forceLink(data.links).id(function(d) { return d.id; }))
    .on("tick", ticked);

  var links = svg.selectAll(".link")
    .data(data.links)
    .enter()
    .append("line")
    .attr("class", "link");

  var nodes = svg.selectAll(".node")
    .data(data.nodes)
    .enter()
    .append("g")
    .attr("class", "node")
    .call(d3.drag()
      .on("start", dragstarted)
      .on("drag", dragged)
      .on("end", dragended))
    .on("click", mostrarModal);

  nodes.append("circle")
    .attr("r", 10);

  function mostrarModal(event) {
  var d = d3.select(this).datum(); // Obtener los datos del nodo
  var modal = document.getElementById("myModal");
  var modalContent = document.getElementById("modalContent");
  modalContent.innerHTML = "<h1> Datos del Autor</h1> <h3> " + d.message + "</h3>" + "<p>Libro: " + d.id + "</p>" + "<p>Editorial: " + d.Editorial + "</p>" + "<p>Fecha: " + d.DATE + "</p>";
  modal.style.display = "block";
}


  window.onclick = function(event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };

  nodes.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  function ticked() {
    links
      .attr("x1", function(d) { return d.source.x; })
      .attr("y1", function(d) { return d.source.y; })
      .attr("x2", function(d) { return d.target.x; })
      .attr("y2", function(d) { return d.target.y; });

    nodes.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  }

  // Funciones para arrastrar los nodos
  function dragstarted(event, d) {
    if (!event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
  }

  function dragged(event, d) {
    d.fx = event.x;
    d.fy = event.y;
  }

  function dragended(event, d) {
    if (!event.active) simulation.alphaTarget(0);
    d.fx = null;
    d.fy = null;
  }
}



////
////omp/template/frontend/pages/index.tpl
////
////contener 1
////src="{$baseUrl}/templates/images/uam/filo.png"
////<img src="{$baseUrl}/templates/images/uam/iztgr.png">
////
////
////
////carrusel 
////src="{$baseUrl}/templates/images/uam/plantilla.jpg"
////
////
////omp/lib/pkp/template/frontend/components/header.tpl
////
////<script src="https://d3js.org/d3.v7.min.js"></script>
////<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
////
////
////
////
////
////
////
////
////
////
////
