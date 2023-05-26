// Selecciona el contenedor de la gráfica
var contenedor = d3.select("#autores");

// Define los datos para la gráfica
var datos = [10, 20, 30, 40, 50];

// Crea los elementos de la gráfica de barras
contenedor.selectAll("div")
  .data(datos)
  .enter()
  .append("div")
  .style("height", function(d) {
    return d + "px";
  });
