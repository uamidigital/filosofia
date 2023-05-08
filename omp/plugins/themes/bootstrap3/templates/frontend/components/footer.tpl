{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

</main>

{* Sidebars *}
{if empty($isFullWidth)}
	{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
	{if $sidebarCode}
		<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary"
			aria-label="{translate|escape key="common.navigation.sidebar"}">
			{$sidebarCode}
		</aside><!-- pkp_sidebar.left -->
	{/if}
{/if}
</div><!-- pkp_structure_content -->

<footer class="footer" style="background-color: #242424;">
	<div class="container" style="color: white;">
		<div class="row">

			{if $pageFooter}
				<div class="col-md-10">
					{$pageFooter}
				</div>
			{/if}

			<div class="col-lg-4 col-md-6">
				<h3 style="color: white;">INFORMACIÓN</h3>
				<p style="text-align: justify;">Av. Ferrocarril San Rafael Atlixco, Núm. 186, Col. Leyes de Reforma 1 A
					Sección, Alcaldía Iztapalapa, C.P. 09310, Ciudad de México</p>

				<div id="map"></div>

			</div>

			<div class="col-lg-4 col-md-6">
				<h3 style="color: white;">Sitios de intéres</h3>
				<div class="media">
					<div class="media-body">
						<h4 class="media-heading">
							<a href="https://signos.izt.uam.mx/" target="_blank"><span style="color: #56a51a;">Revista
									Signos</span>
							</a>
						</h4>
						<p>Sitio de la revista Signos del departamento de filosofía</p>
					</div>
				</div>
				<div class="media">
					<div class="media-body">
						<h4 class="media-heading"><a href="https://bindani.izt.uam.mx/" target="_blank"><span
									style="color: #56a51a;">BINDANI</span></h4></a>
						<p>Repositorio institucional BINDANI</p>
					</div>
				</div>

				<div class="media">
					<div class="media-body">
						<h4 class="media-heading"><a href="http://www.iztapalapa.uam.mx/" target="_blank"><span
									style="color: #56a51a;">UAM Iztapalapa</span></h4></a>
						<p>Sitio oficial de la unidad iztapalapa</p>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
			<h3 style="color: white;">Indexado y referenciado en </h3>
			<div class="row">
			<div class="col-md-2">
			<a href="https://bindani.izt.uam.mx">
				<img class="img-bindani" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/bindani.svg">
			</a>
			</div>

			<div class="col-md-2">
			<a href="https://scholar.google.com">
				<img class="img-scholar" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/Google_Scholar_logo.svg">
			</a> 
			</div>
			<!--
			<h3 style="color: white;">Indexado y referenciado en </h3>
			<a href="https://bindani.izt.uam.mx">
				<img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/bindani.svg">
			</a>


			<a href="https://scholar.google.com">
				<img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/Google_Scholar_logo.svg">
			</a> -->

			</div>
			</div>

			<div class="col-lg-4">
			<h3 style="color: white;">Síguenos en nuestras redes</h3>
			<div class="row">
			<div class="col-md-2">
			<a href="https://twitter.com/DeptoFilosofia">
				<img class="img-social" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/twitter.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="https://www.instagram.com/departamentodefilosofiauami/">
				<img class="img-social" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/instagram.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="https://www.facebook.com/DepartamentoFilosofiaUAMI">
				<img class="img-social" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/facebook.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="mailto:depto.filosofia.uami@gmail.com">
				<img class="img-social" alt="{translate key="about.aboutThisPublishingSystem"}"
					src="https://revistas.izt.uam.mx/uploads/images/gmail.png">
			</a>
			</div>
			</div>

			</div>
		</div>
		<br>
		<br>
		<br>

	</div>
	</div>
	<br/>
	
	<div class="logouam" style="background-color: whitesmoke; padding-right: 2rem; padding-top: 3rem; padding-bottom: 5rem; text-align:center;">
		<img src="https://revistas.izt.uam.mx/uploads/images/uam_base.svg" alt="" style="width: 250px; ">
	</div>

	<hr>


	<div class="copyright text-center" style="color: #444; background-color:whitesmoke; padding-bottom: 2rem;">
		Copyright &copy; 2022 <span>Departamento de Filosofía | Universidad Autónoma Metropolitana <span
				style="color: #56a51a;">Unidad Iztapalapa</span>
	</div>
	</div>


</footer>

</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}



</body>

</html>