{**
 * templates/frontend/pages/index.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the front page of the site
 *
 * @uses $homepageImage array Details about the uploaded homepage image
 * @uses $spotlights array Selected spotlights to promote on the homepage
 * @uses $featuredMonographs array List of featured releases in this press
 * @uses $newReleases array List of new releases in this press
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $additionalHomeContent string HTML blob of arbitrary content added by
 *  an editor/admin.
 *}
{include file="frontend/components/header.tpl"}

<div class="page page_homepage">

<div  class="container">
<div class="row">
	<div class="col-sm-12">
		<br>
		<br>
		<div class="contenedor2">
			<img src="{$baseUrl}/templates/images/uam/filo.png" alt="Imagen" class="corner-image"> 
			<div class="cropped">
				<img src="{$baseUrl}/templates/images/uam/iztgr.png">
			</div>
		</div>
		<br>
		<br>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
	<div class="contenedor">
	<div id="carrusel-contenido">
		<div id="carrusel-caja">
			<div class="carrusel-elemento">
				<img class="imagenes" src="{$baseUrl}/templates/images/uam/plantilla.jpg">
			</div>
			<div class="carrusel-elemento">   
				<img class="imagenes" src="{$baseUrl}/templates/images/uam/plantilla.jpg">
			</div>
			<div class="carrusel-elemento">   
				<img class="imagenes" src="{$baseUrl}/templates/images/uam/plantilla.jpg">                        
			</div>
		</div>
	</div>
</div>
	</div>
</div>
</div>
<div class="container">
<div class="row">
	<div class="col-sm-12">
	<div class="container3">
	<div class="lbl-menu">
		<label for="radio1">Destacado</label>
		<label for="radio2">Novedades</label>
		<label for="radio3">Proximos</label>
		<label for="radio4">Ir al catálogo</label>
	</div>
	
	<div class="content">
	   
		<input type="radio" name="radio" id="radio1" checked>
		<div class="tab1">
			<h2>Inicio</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
		</div>
		
		<input type="radio" name="radio" id="radio2">
		<div class="tab2">
		{include file="frontend/components/spotlights.tpl"}
			<h2>Servicios</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
		</div>
		
		<input type="radio" name="radio" id="radio3">
		<div class="tab3">
		{$additionalHomeContent}
		</div>
		
		<input type="radio" name="radio" id="radio4">
		<div class="tab4">
			<h2>Red de autores</h2>
			<svg id="graph-container"></svg>
		</div>
	</div>
	<script>
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
  // Agrega más nodos y mensajes aquí según tus necesidades
],
links: [
  { source: "nodo1", target: "nodo9" },
  { source: "nodo2", target: "nodo8" },
  { source: "nodo3", target: "nodo4" },
  { source: "nodo3", target: "nodo5" },
  { source: "nodo3", target: "nodo2" },
  { source: "nodo3", target: "nodo9" },
  { source: "nodo4", target: "nodo8" },
  { source: "nodo5", target: "nodo6" },
  { source: "nodo6", target: "nodo7" },
  { source: "nodo7", target: "nodo1" },
  { source: "nodo8", target: "nodo9" },
  { source: "nodo9", target: "nodo11" },
  { source: "nodo10", target: "nodo12" },
  { source: "nodo12", target: "nodo1" }
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
.force("charge", d3.forceManyBody())
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

	</script>
</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>

	{* Homepage Image *}
	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
	{/if}

	{* Spotlights *}
	{if !empty($spotlights)}
		<h2 id="homepageSpotlights" class="pkp_screen_reader">
			{translate key="spotlight.spotlights"}
		</h2>
		{include file="frontend/components/spotlights.tpl"}
	{/if}


	{* Featured *}
	{if !empty($featuredMonographs)}
		{include file="frontend/components/monographList.tpl" monographs=$featuredMonographs titleKey="catalog.featured"}
	{/if}

	{* New releases *}
	{if !empty($newReleases)}
		{include file="frontend/components/monographList.tpl" monographs=$newReleases titleKey="catalog.newReleases"}
	{/if}

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<div id="homepageAnnouncements" class="cmp_announcements highlight_first">
			<h2>
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
				{else}
					<article class="obj_announcement_summary">
						<h4>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<div class="date">
							{$announcement->getDatePosted()|date_format:$dateFormatShort}
						</div>
					</article>
				{/if}
			{/foreach}
			</div><!-- .more -->
		</div>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}

</div>
<div id="autores"></div>
{include file="frontend/components/footer.tpl"}
