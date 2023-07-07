<?php
/* Smarty version 4.1.0, created on 2023-07-07 23:49:28
  from 'app:frontendpagesindex.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_64a888680d7b70_19038003',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '39b1599f8f1b1d44415ae2df41968bb30a1154ef' => 
    array (
      0 => 'app:frontendpagesindex.tpl',
      1 => 1688766563,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/spotlights.tpl' => 1,
    'app:frontend/components/monographList.tpl' => 2,
    'app:frontend/objects/announcement_summary.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_64a888680d7b70_19038003 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/opt/lampp/htdocs/filosofia/omp/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="page page_homepage">

<div class="container">
    <img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/filo.png" alt="Imagen" class="corner-image"> 
    <div class="cropped">
      <img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/iztgr.png">
    </div>
  </div>

  <div class="container3">
    <div class="carousel">
      <img class="slide" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg" alt="plantilla1">
      <img class="slide" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg" alt="plantilla2">
      <img class="slide" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg" alt="plantilla3">
      <img class="slide" src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/templates/images/uam/plantilla.jpg" alt="plantilla4">
      
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
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/spotlights.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
	<?php }?>


		<?php if (!empty($_smarty_tpl->tpl_vars['featuredMonographs']->value)) {?>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/monographList.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('monographs'=>$_smarty_tpl->tpl_vars['featuredMonographs']->value,'titleKey'=>"catalog.featured"), 0, false);
?>
	</div>
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


<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/public/JS/script.js"><?php echo '</script'; ?>
><?php }
}
