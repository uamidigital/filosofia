<?php
/* Smarty version 4.1.0, created on 2023-06-07 22:13:03
  from 'app:controllersgridnavigation' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6480e4cf87c491_09128522',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '761d3bb2173003084ba932a96f2c5a12ab8e00aa' => 
    array (
      0 => 'app:controllersgridnavigation',
      1 => 1684945243,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6480e4cf87c491_09128522 (Smarty_Internal_Template $_smarty_tpl) {
$_block_plugin10 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin10, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('id'=>(defined('NMI_TYPE_CATEGORY') ? constant('NMI_TYPE_CATEGORY') : null),'class'=>"NMI_TYPE_CUSTOM_EDIT",'title'=>"manager.navigationMenus.form.navigationMenuItem.category",'for'=>"categorySelect"));
$_block_repeat=true;
echo $_block_plugin10->smartyFBVFormSection(array('id'=>(defined('NMI_TYPE_CATEGORY') ? constant('NMI_TYPE_CATEGORY') : null),'class'=>"NMI_TYPE_CUSTOM_EDIT",'title'=>"manager.navigationMenus.form.navigationMenuItem.category",'for'=>"categorySelect"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
	<?php if (count($_smarty_tpl->tpl_vars['navigationMenuItemCategoryTitles']->value) > 0) {?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"select",'id'=>"relatedCategoryId",'required'=>true,'from'=>$_smarty_tpl->tpl_vars['navigationMenuItemCategoryTitles']->value,'selected'=>$_smarty_tpl->tpl_vars['selectedRelatedObjectId']->value,'label'=>"manager.navigationMenus.form.navigationMenuItemCategoryMessage",'translate'=>false),$_smarty_tpl ) );?>

	<?php } else { ?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.navigationMenus.form.navigationMenuItem.category.noItems"),$_smarty_tpl ) );?>

	<?php }
$_block_repeat=false;
echo $_block_plugin10->smartyFBVFormSection(array('id'=>(defined('NMI_TYPE_CATEGORY') ? constant('NMI_TYPE_CATEGORY') : null),'class'=>"NMI_TYPE_CUSTOM_EDIT",'title'=>"manager.navigationMenus.form.navigationMenuItem.category",'for'=>"categorySelect"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

<?php }
}
