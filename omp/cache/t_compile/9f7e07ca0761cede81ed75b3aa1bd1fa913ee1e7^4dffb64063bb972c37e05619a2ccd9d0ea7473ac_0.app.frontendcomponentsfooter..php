<?php
/* Smarty version 4.1.0, created on 2023-05-12 22:20:14
  from 'app:frontendcomponentsfooter.' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_645e9f7e33dbf4_31672802',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4dffb64063bb972c37e05619a2ccd9d0ea7473ac' => 
    array (
      0 => 'app:frontendcomponentsfooter.',
      1 => 1683663396,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_645e9f7e33dbf4_31672802 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!--Linea para que sea responsivo-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--Iconos-->
<?php echo '<script'; ?>
 src="https://kit.fontawesome.com/eb496ab1a0.js" crossorigin="anonymous"><?php echo '</script'; ?>
>

</div><!-- pkp_structure_main -->

<?php if (empty($_smarty_tpl->tpl_vars['isFullWidth']->value)) {
$_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "sidebarCode", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Sidebar"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);
if ($_smarty_tpl->tpl_vars['sidebarCode']->value) {?>
<div class="pkp_structure_sidebar left" role="complementary" aria-label="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"
	common.navigation.sidebar"),$_smarty_tpl ) ) ));?>
">
	<?php echo $_smarty_tpl->tpl_vars['sidebarCode']->value;?>

</div><!-- pkp_sidebar.left -->
<?php }
}?>
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
					<img src=<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/bindani.svg>

					<div class="go">
			<img src=<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/google.svg>
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
			<img src=<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/iztapalapa.png></div>
		</div>
		<div class="grupo-3">
			<img src=<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam_base.svg>
		</div>
			
		</div>
	</footer>

</div>




<div class="pkp_structure_footer">

	<?php if ($_smarty_tpl->tpl_vars['pageFooter']->value) {?>
	<div class="pkp_footer_content">
		<?php echo $_smarty_tpl->tpl_vars['pageFooter']->value;?>

	</div>
	<?php }?>


</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"frontend"),$_smarty_tpl ) );?>


<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Footer::PageFooter"),$_smarty_tpl ) );?>

</body>

</html><?php }
}
