{**
* templates/frontend/components/footer.tpl
*
* Copyright (c) 2014-2021 Simon Fraser University
* Copyright (c) 2003-2021 John Willinsky
* Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
*
* @brief Common site frontend footer.
*
* @uses $isFullWidth bool Should this page be displayed without sidebars? This
* represents a page-level override, and doesn't indicate whether or not
* sidebars have been configured for thesite.
*}

<!--Linea para que sea responsivo-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--Iconos-->
<script src="https://kit.fontawesome.com/eb496ab1a0.js" crossorigin="anonymous"></script>

</div><!-- pkp_structure_main -->

{* Sidebars *}
{if empty($isFullWidth)}
{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
{if $sidebarCode}
<div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="
	common.navigation.sidebar"}">
	{$sidebarCode}
</div><!-- pkp_sidebar.left -->
{/if}
{/if}
</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>
	<!--PIE DE PAGINA-->
	<!--CAJA 1-->
	<footer class="pie-pagina">
		<div class="grupo-1">
			<div class="box">
				<h2>Información</h2> <!--TITULO-->
				<p>Av. Ferrocarril San Rafael Atlixco, Núm. 186, Col. Leyes de Reforma 1 A Sección, Alcaldía Iztapalapa, C.P 09310, Ciudad de México</p> <!--PARRAFO DE DIRECCIÓN-->
				<div id="map"></div> <!--MAPA DE LA UAM-->
			</div>
			<!--CAJA 2-->
			<div class="box">
				<h2>Sitios de intéres</h2>
				<h3>Revista Signos</h3>
				<p>Sitio de la revista Signos del departamento de filosofía</p>
				<h3>BINDANI</h3>
				<p>Repositorio institucional BINDANI</p>
				<h3>UAM Iztapalapa</h3>
				<p>Sitio oficial de la unidad Iztapalapa</p>
			</div>
			<!--CAJA 3-->
			<div class="box">
				<h2>Indexado y <br>referenciado en</h2>
				<div>
					<img src={$baseUrl}/templates/images/bindani.svg>

					<div class="go">
			<img src={$baseUrl}/templates/images/google.svg>
			</div>

		</div>
				
			<br><br><br>
				<h2>Síguenos en nuestras <br> redes</h2>
				<div class="red-social">
					<a href="#" class="fa fa-facebook"></a>
					<a href="#" class="fa fa-twitter"></a>
					<a href="#" class="fa fa-instagram"></a>
					</div>
					
				</div>
			</div>
		</div>
		<div class="grupo-2">
			<img src={$baseUrl}/templates/images/iztapalapa.png></div>
		</div>
		<div class="grupo-3">
			<img src={$baseUrl}/templates/images/uam_base.svg>
		</div>
			
		</div>
	</footer>

</div>




<div class="pkp_structure_footer">

	{if $pageFooter}
	<div class="pkp_footer_content">
		{$pageFooter}
	</div>
	{/if}


</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>

</html>