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

<div class="container">
    <img src="{$baseUrl}/templates/images/uam/filo.png" alt="Imagen" class="corner-image"> 
    <div class="cropped">
      <img src="{$baseUrl}/templates/images/uam/iztgr.png">
    </div>
  </div>

  <div class="container3">
    <div class="carousel">
      <img class="slide" src="{$baseUrl}/templates/images/uam/plantilla.jpg" alt="plantilla1">
      <img class="slide" src="{$baseUrl}/templates/images/uam/plantilla.jpg" alt="plantilla2">
      <img class="slide" src="{$baseUrl}/templates/images/uam/plantilla.jpg" alt="plantilla3">
      <img class="slide" src="{$baseUrl}/templates/images/uam/plantilla.jpg" alt="plantilla4">
      
      <button class="prev" onclick="changeSlide(-1)">&#10094;</button>
      <button class="next" onclick="changeSlide(1)">&#10095;</button>
    </div>
  </div>



  <div class="container1">
    <div class="tab-menu">
      <button class="tab active" onclick="openTab(event, 'tab1')">Destacado</button>
      <button class="tab" onclick="openTab(event, 'tab2')">Novedades</button>
      <button class="tab" onclick="openTab(event, 'tab3')">Proximos</button>
      <button class="tab" onclick="openTab(event, 'tab4')">Ir al catálogo</button>
    </div>
    <div class="tab-content" id="tab1">
      <h2>Inicio</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
    </div>
    <div class="tab-content" id="tab2">
      <h2>Servicios</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
    </div>
    <div class="tab-content" id="tab3">
      <h2>Proximos</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
    </div>
    <div class="tab-content" id="tab4">
      <h2>Red de autores</h2>
      <div id="grafico"></div>
    </div>
  </div>

  <!-- Modal -->
  <div id="myModal" class="modal">
    <div id="modalContent" class="modal-content">
      <!-- Contenido del modal -->
    </div>
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
		{include file="frontend/components/monographList.tpl" monographs=$featuredMonographs titleKey="catalog.featured"} fsfdf
	{/if}

	{* New releases *}
	{if !empty($newReleases)}
		{include file="frontend/components/monographList.tpl" monographs=$newReleases titleKey="catalog.newReleases"} sa
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
<script src="{$baseUrl}/public/JS/script.js"></script>