<?php
/* Smarty version 4.1.0, created on 2023-05-13 00:37:57
  from 'app:frontendcomponentsfooter.' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_645ebfc522d3c5_89771196',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4dffb64063bb972c37e05619a2ccd9d0ea7473ac' => 
    array (
      0 => 'app:frontendcomponentsfooter.',
      1 => 1683930615,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_645ebfc522d3c5_89771196 (Smarty_Internal_Template $_smarty_tpl) {
?>
</main>

<?php if (empty($_smarty_tpl->tpl_vars['isFullWidth']->value)) {?>
	<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "sidebarCode", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Sidebar"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
	<?php if ($_smarty_tpl->tpl_vars['sidebarCode']->value) {?>
		<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary"
			aria-label="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.sidebar"),$_smarty_tpl ) ) ));?>
">
			<?php echo $_smarty_tpl->tpl_vars['sidebarCode']->value;?>

		</aside><!-- pkp_sidebar.left -->
	<?php }
}?>
</div><!-- pkp_structure_content -->

<footer class="footer" style="background-color: #242424;">
	<div class="container" style="color: white;">
		<div class="row">

			<?php if ($_smarty_tpl->tpl_vars['pageFooter']->value) {?>
				<div class="col-md-10">
					<?php echo $_smarty_tpl->tpl_vars['pageFooter']->value;?>

				</div>
			<?php }?>

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
				<img class="img-bindani" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/bindani.svg">
			</a>
			</div>

			<div class="col-md-2">
			<a href="https://scholar.google.com">
				<img class="img-scholar" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/Google_Scholar_logo.svg">
			</a> 
			</div>
			<!--
			<h3 style="color: white;">Indexado y referenciado en </h3>
			<a href="https://bindani.izt.uam.mx">
				<img class="img-responsive" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/bindani.svg">
			</a>


			<a href="https://scholar.google.com">
				<img class="img-responsive" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/Google_Scholar_logo.svg">
			</a> -->

			</div>
			</div>

			<div class="col-lg-4">
			<h3 style="color: white;">Síguenos en nuestras redes</h3>
			<div class="row">
			<div class="col-md-2">
			<a href="https://twitter.com/DeptoFilosofia">
				<img class="img-social" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/twitter.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="https://www.instagram.com/departamentodefilosofiauami/">
				<img class="img-social" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/instagram.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="https://www.facebook.com/DepartamentoFilosofiaUAMI">
				<img class="img-social" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
					src="https://revistas.izt.uam.mx/uploads/images/facebook.png">
			</a>
			</div>
			<div class="col-md-2">
			<a href="mailto:depto.filosofia.uami@gmail.com">
				<img class="img-social" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutThisPublishingSystem"),$_smarty_tpl ) );?>
"
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

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"frontend",'scripts'=>$_smarty_tpl->tpl_vars['scripts']->value),$_smarty_tpl ) );?>


<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Footer::PageFooter"),$_smarty_tpl ) );?>




</body>

</html><?php }
}
