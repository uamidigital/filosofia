const id = 9;
var graphData = { nodes: [], links: [] };

var fetchPromises = [];

for (let i = 1; i <= id; i++) {
  const fetchPromise = fetch('http://localhost/filosofia/omp/index.php/pf/api/v1/submissions/' + i + '/publications/' + i)
    .then(response => response.json())
    .then(data => {
      const authors = data.authorsStringShort;
      graphData.nodes.push({ id: i, message: authors });
      console.log(authors, i);
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
  var width = 400;
  var height = 200;

  // Crear el contenedor SVG
  var svg = d3.select("#grafico")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  // Crear la simulación de fuerza
  var simulation = d3.forceSimulation(data.nodes)
    .force("charge", d3.forceManyBody().strength(-0.1))
    .force("center", d3.forceCenter(150, 100))
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

  function mostrarModal(d) {
    var modal = document.getElementById("myModal");
    var modalContent = document.getElementById("modalContent");
    modalContent.innerHTML = "<h3>" + d.id + "</h3>" + "<p>Conexiones: " + d.message + "</p>";
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
