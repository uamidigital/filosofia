<?php
/* Smarty version 4.1.0, created on 2023-06-08 00:39:01
  from 'app:frontendpagesindex.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_648107055caf59_08241977',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '39b1599f8f1b1d44415ae2df41968bb30a1154ef' => 
    array (
      0 => 'app:frontendpagesindex.tpl',
      1 => 1686177538,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/spotlights.tpl' => 2,
    'app:frontend/components/monographList.tpl' => 2,
    'app:frontend/objects/announcement_summary.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_648107055caf59_08241977 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/opt/lampp/htdocs/filosofia/omp/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="page page_homepage">

<div  class="container">
	<div class="row">
		<div class="col-sm-12">
			<br>
			<br>
			<div class="contenedor2">
				<img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/filo.png" alt="Imagen" class="corner-image"> 
				<div class="cropped">
					<img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/iztgr.png">
				</div>
			</div>
			<br>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="contenedor">
				<div id="carrusel-contenido">
					<div id="carrusel-caja">
						<div class="carrusel-elemento">
							<img class="imagenes" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg">
						</div>
						<div class="carrusel-elemento">
							<img class="imagenes" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg">
						</div>
						<div class="carrusel-elemento">
							<img class="imagenes" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg">
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
						<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/spotlights.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
						<h2>Servicios</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis similique, expedita officiis enim iusto alias autem doloribus deleniti. Alias mollitia inventore neque dicta fuga, quos quis, facere at quae, laudantium est asperiores illo nulla nisi iure eum, aperiam facilis in.</p>
					</div>
					<input type="radio" name="radio" id="radio3">
					<div class="tab3">
						<?php echo $_smarty_tpl->tpl_vars['additionalHomeContent']->value;?>

					</div>
					<input type="radio" name="radio" id="radio4">
					<div class="tab4">
						<h2>Red de autores</h2>
						<svg id="graph-container"></svg>
					</div>
					<br><br>
					<br><br>
					<br><br>
					<br><br>
					<br><br>
					<br><br>
					<br><br>
				</div>
			</div>
		</div>
	</div>
</div>

		<?php if (!$_smarty_tpl->tpl_vars['activeTheme']->value->getOption('useHomepageImageAsHeader') && $_smarty_tpl->tpl_vars['homepageImage']->value) {?>
		<img src="<?php echo $_smarty_tpl->tpl_vars['publicFilesDir']->value;?>
/<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImage']->value['uploadName'],"url" ));?>
" alt="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImageAltText']->value ));?>
">
	<?php }?>

		<?php if (!empty($_smarty_tpl->tpl_vars['spotlights']->value)) {?>
		<h2 id="homepageSpotlights" class="pkp_screen_reader">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"spotlight.spotlights"),$_smarty_tpl ) );?>

		</h2>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/spotlights.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
	<?php }?>


		<?php if (!empty($_smarty_tpl->tpl_vars['featuredMonographs']->value)) {?>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/monographList.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('monographs'=>$_smarty_tpl->tpl_vars['featuredMonographs']->value,'titleKey'=>"catalog.featured"), 0, false);
?>
	<?php }?>

		<?php if (!empty($_smarty_tpl->tpl_vars['newReleases']->value)) {?>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/monographList.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('monographs'=>$_smarty_tpl->tpl_vars['newReleases']->value,'titleKey'=>"catalog.newReleases"), 0, true);
?>
	<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value && count($_smarty_tpl->tpl_vars['announcements']->value)) {?>
		<div id="homepageAnnouncements" class="cmp_announcements highlight_first">
			<h2>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"announcement.announcements"),$_smarty_tpl ) );?>

			</h2>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['announcements']->value, 'announcement', false, NULL, 'announcements', array (
  'iteration' => true,
));
$_smarty_tpl->tpl_vars['announcement']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['announcement']->value) {
$_smarty_tpl->tpl_vars['announcement']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']++;
?>
				<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration'] : null) > $_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value) {?>
					<?php break 1;?>
				<?php }?>
				<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration'] : null) == 1) {?>
					<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/announcement_summary.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('heading'=>"h3"), 0, true);
?>
					<div class="more">
				<?php } else { ?>
					<article class="obj_announcement_summary">
						<h4>
							<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"announcement",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['announcement']->value->getId()),$_smarty_tpl ) );?>
">
								<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['announcement']->value->getLocalizedTitle() ));?>

							</a>
						</h4>
						<div class="date">
							<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['announcement']->value->getDatePosted(),$_smarty_tpl->tpl_vars['dateFormatShort']->value);?>

						</div>
					</article>
				<?php }?>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</div><!-- .more -->
		</div>
	<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['additionalHomeContent']->value) {?>
		<div class="additional_content">
			<?php echo $_smarty_tpl->tpl_vars['additionalHomeContent']->value;?>

		</div>
	<?php }?>

</div>
<div id="autores"></div>
<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/public/JS/script.js"><?php echo '</script'; ?>
><?php }
}
