// Datos de ejemplo con nodos
var data = {
  nodes: [
    { id: "nodo1", message: "Mensaje 1" },
    { id: "nodo2", message: "Mensaje 2" },
    { id: "nodo3", message: "Mensaje 3" },
    { id: "nodo4", message: "Mensaje 4" },
    { id: "nodo5", message: "Mensaje 5" },
    { id: "nodo6", message: "Mensaje 6" },
    { id: "nodo7", message: "Mensaje 7" },
    { id: "nodo8", message: "Mensaje 8" },
    { id: "nodo9", message: "Mensaje 9" },
    { id: "nodo10", message: "Mensaje 10" },
    { id: "nodo11", message: "Mensaje 11" },
    { id: "nodo12", message: "Mensaje 12" },
    { id: "nodo11", message: "Mensaje 1" },
    { id: "nodo12", message: "Mensaje 6" },
    { id: "nodo13", message: "Mensaje 10" },
    { id: "nodo14", message: "Mensaje 7" }
    // Agrega más nodos y mensajes aquí según tus necesidades
    ],
  links: [
    
    ]
};

// Configuración del gráfico
//var width = 600;
//var height = 200;

// Crear el contenedor SVG
var svg = d3.select("#graph-container")
.attr("width", 600)
.attr("height", 200);

// Crear la simulación de fuerza
var simulation = d3.forceSimulation(data.nodes)
.force("charge", d3.forceManyBody().strength(-5))
.force("center", d3.forceCenter(200, 120))
.force("link", d3.forceLink(data.links).id(function(d) { return d.id; }))
.on("tick", ticked);

// Crear los enlaces
var links = svg.selectAll(".link")
.data(data.links)
.enter()
.append("line")
.attr("class", "link");

// Crear los nodos
var nodes = svg.selectAll(".node")
.data(data.nodes)
.enter()
.append("g")
.attr("class", "node")
.call(d3.drag()
  .on("start", dragstarted)
  .on("drag", dragged)
  .on("end", dragended));

// Agregar los círculos de los nodos
nodes.append("circle")
.attr("r", 10);

// Agregar las ventanas emergentes a los nodos
nodes.append("foreignObject")
.attr("class", "node-popover")
.attr("width", 120)
.attr("height", 80)
.append("xhtml:div")
.style("width", "100%")
.style("height", "100%")
.style("display", "flex")
.style("justify-content", "center")
.style("align-items", "center")
.html(function(d) { return "<p>" + d.message + "</p>"; });

// Posicionar los nodos
nodes.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

// Función ticked para actualizar la posición de los elementos
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
