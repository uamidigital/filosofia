<?php
/* Smarty version 4.1.0, created on 2023-06-19 22:42:33
  from 'app:frontendcomponentsspotlig' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6490bdb9328436_93657185',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '623c32cd88e28d6784ecf29f6d0bd57ab00248a1' => 
    array (
      0 => 'app:frontendcomponentsspotlig',
      1 => 1687207331,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/objects/spotlight.tpl' => 1,
  ),
),false)) {
function content_6490bdb9328436_93657185 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/opt/lampp/htdocs/filosofia/omp/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.truncate.php','function'=>'smarty_modifier_truncate',),));
?>
<div class="cmp_spotlights">
	<ul class="list">
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['spotlights']->value, 'spotlight', false, NULL, 'spotlights', array (
  'iteration' => true,
));
$_smarty_tpl->tpl_vars['spotlight']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['spotlight']->value) {
$_smarty_tpl->tpl_vars['spotlight']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']++;
?>
			<li<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration'] : null) == 1) {?> class="current"<?php }?>>
				<a href="#" data-spotlight="<?php echo (isset($_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration'] : null);?>
">
					<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['spotlight']->value->getLocalizedTitle() ));?>

				</a>
			</li>
		<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
	</ul>

	<ul class="spotlights">
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['spotlights']->value, 'spotlight', false, NULL, 'spotlights', array (
  'iteration' => true,
));
$_smarty_tpl->tpl_vars['spotlight']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['spotlight']->value) {
$_smarty_tpl->tpl_vars['spotlight']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']++;
?>
			<?php $_smarty_tpl->_assignInScope('item', $_smarty_tpl->tpl_vars['spotlight']->value->getSpotlightItem());?>
			<?php $_smarty_tpl->_assignInScope('assocType', $_smarty_tpl->tpl_vars['spotlight']->value->getAssocType());?>
			<?php $_smarty_tpl->_assignInScope('coverImage', '');?>
			<?php $_smarty_tpl->_assignInScope('coverImageUrl', '');?>
			<?php $_smarty_tpl->_assignInScope('targetUrl', '');?>
			<?php if ($_smarty_tpl->tpl_vars['assocType']->value == (defined('SPOTLIGHT_TYPE_BOOK') ? constant('SPOTLIGHT_TYPE_BOOK') : null)) {?>
				<?php $_smarty_tpl->_assignInScope('type', "is_book");?>
				<?php $_smarty_tpl->_assignInScope('coverImage', $_smarty_tpl->tpl_vars['item']->value->getCoverImage());?>
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'targetUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"catalog",'op'=>"book",'path'=>$_smarty_tpl->tpl_vars['item']->value->getBestId()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'coverImageUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"submission.CoverHandler",'op'=>"thumbnail",'submissionId'=>$_smarty_tpl->tpl_vars['item']->value->getId()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php } elseif ($_smarty_tpl->tpl_vars['assocType']->value == (defined('SPOTLIGHT_TYPE_SERIES') ? constant('SPOTLIGHT_TYPE_SERIES') : null)) {?>
				<?php $_smarty_tpl->_assignInScope('type', "is_series");?>
				<?php $_smarty_tpl->_assignInScope('coverImage', $_smarty_tpl->tpl_vars['item']->value->getImage());?>
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'targetUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"catalog",'op'=>"series",'path'=>$_smarty_tpl->tpl_vars['item']->value->getPath()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'coverImageUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"catalog",'op'=>"thumbnail",'type'=>"series",'id'=>$_smarty_tpl->tpl_vars['item']->value->getId()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php }?>
			<?php $_smarty_tpl->_assignInScope('hasCoverImage', '');?>
			<?php if ($_smarty_tpl->tpl_vars['coverImage']->value) {?>
				<?php $_smarty_tpl->_assignInScope('hasCoverImage', "has_image");?>
			<?php }?>
			<?php $_smarty_tpl->_assignInScope('description', '');?>
			<?php if ($_smarty_tpl->tpl_vars['spotlight']->value->getLocalizedDescription()) {?>
				<?php $_smarty_tpl->_assignInScope('description', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( smarty_modifier_truncate($_smarty_tpl->tpl_vars['spotlight']->value->getLocalizedDescription(),600) )));?>
			<?php } else { ?>
				<?php if ($_smarty_tpl->tpl_vars['assocType']->value == (defined('SPOTLIGHT_TYPE_SERIES') ? constant('SPOTLIGHT_TYPE_SERIES') : null)) {?>
					<?php $_smarty_tpl->_assignInScope('description', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( smarty_modifier_truncate($_smarty_tpl->tpl_vars['item']->value->getLocalizedDescription(),600) )));?>
				<?php } elseif ($_smarty_tpl->tpl_vars['assocType']->value == (defined('SPOTLIGHT_TYPE_BOOK') ? constant('SPOTLIGHT_TYPE_BOOK') : null)) {?>
					<?php $_smarty_tpl->_assignInScope('description', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( smarty_modifier_truncate($_smarty_tpl->tpl_vars['item']->value->getLocalizedAbstract(),600) )));?>
				<?php }?>
			<?php }?>

			<li class="spotlight_<?php echo (isset($_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration'] : null);
if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_spotlights']->value['iteration'] : null) == 1) {?> current<?php }?>">
				<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/spotlight.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
			</li>
		<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
	</ul>
</div>
<?php }
}
