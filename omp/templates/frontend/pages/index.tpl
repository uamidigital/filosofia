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
			<svg id="chart"></svg>
		</div>
	</div>
	<script>
    // Datos de ejemplo (nodos y enlaces)
    var nodes = [
      { id: 1, name: "Nodo 1" },
      { id: 2, name: "Nodo 2" },
      { id: 3, name: "Nodo 3" },
      { id: 4, name: "Nodo 4" },
      { id: 5, name: "Nodo 5" },
      { id: 6, name: "Nodo 6" },
      { id: 7, name: "Nodo 7" },
      { id: 8, name: "Nodo 8" },
      { id: 9, name: "Nodo 9" },
      { id: 10, name: "Nodo 10" },
      { id: 11, name: "Nodo 11" },
      { id: 12, name: "Nodo 12" },
    ];

    var links = [
      { source: 1, target: 9 },
      { source: 2, target: 8 },
      { source: 3, target: 4 },
      { source: 3, target: 5 },
      { source: 3, target: 2 },
      { source: 3, target: 9 },
      { source: 4, target: 8 },
      { source: 5, target: 6 },
      { source: 6, target: 7 },
      { source: 7, target: 1 },
      { source: 8, target: 9 },
      { source: 9, target: 11 },
      { source: 10, target: 12 },
      { source: 12, target: 1 },
    ];

    // Crear la selección SVG y establecer el tamaño del gráfico
    var svg = d3.select("#chart")
                .attr("width", 670)
                .attr("height", 200);

    // Crear la simulación de fuerza dirigida
    var simulation = d3.forceSimulation(nodes)
                       .force("link", d3.forceLink(links).id(function(d) { return d.id; }))
                       .force("charge", d3.forceManyBody())
                       .force("center", d3.forceCenter(350, 100))
                       .on("tick", ticked);

    // Crear los enlaces
    var link = svg.selectAll(".link")
                  .data(links)
                  .enter()
                  .append("line")
                  .attr("class", "link");

    // Crear los nodos
    var node = svg.selectAll(".node")
                  .data(nodes)
                  .enter()
                  .append("circle")
                  .attr("class", "node")
                  .attr("r", 10)
                  .call(drag(simulation));

    // Función para actualizar la posición de los elementos en cada tick de la simulación
    function ticked() {
      link.attr("x1", function(d) { return d.source.x; })
          .attr("y1", function(d) { return d.source.y; })
          .attr("x2", function(d) { return d.target.x; })
          .attr("y2", function(d) { return d.target.y; });

      node.attr("cx", function(d) { return d.x; })
          .attr("cy", function(d) { return d.y; });
    }

    // Función para permitir arrastrar los nodos
    function drag(simulation) {
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

      return d3.drag()
               .on("start", dragstarted)
               .on("drag", dragged)
               .on("end", dragended);
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
