<?php
/* Smarty version 4.1.0, created on 2023-06-21 00:31:49
  from 'plugins-1-plugins-generic-customLocale-generic-customLocale:customLocaleGridFilter.tp' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_649228d57e5463_70576723',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '960c89a537ca95561615cb450a743619d33906f3' => 
    array (
      0 => 'plugins-1-plugins-generic-customLocale-generic-customLocale:customLocaleGridFilter.tp',
      1 => 1687202751,
      2 => 'plugins-1-plugins-generic-customLocale-generic-customLocale',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_649228d57e5463_70576723 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
 type="text/javascript">
	// Attach the form handler to the form.
	$('#customLocaleSearchForm').pkpHandler('$.pkp.controllers.form.ClientFormHandler',
		{
			trackFormChanges: false
		}
	);
<?php echo '</script'; ?>
>

<form class="pkp_form" id="customLocaleSearchForm" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"plugins.generic.customLocale.controllers.grid.CustomLocaleGridHandler",'op'=>"fetchGrid"),$_smarty_tpl ) );?>
" method="post">
	<?php $_block_plugin1 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormArea'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormArea'][0][0] : null;
if (!is_callable(array($_block_plugin1, 'smartyFBVFormArea'))) {
throw new SmartyException('block tag \'fbvFormArea\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormArea', array('id'=>"userSearchFormArea"));
$_block_repeat=true;
echo $_block_plugin1->smartyFBVFormArea(array('id'=>"userSearchFormArea"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php $_block_plugin2 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin2, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('title'=>"plugins.generic.customLocale.search.fileName",'for'=>"search"));
$_block_repeat=true;
echo $_block_plugin2->smartyFBVFormSection(array('title'=>"plugins.generic.customLocale.search.fileName",'for'=>"search"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"text",'name'=>"search",'id'=>"search",'value'=>$_smarty_tpl->tpl_vars['filterSelectionData']->value['search'],'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['LARGE'],'inline'=>"true"),$_smarty_tpl ) );?>

			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"select",'name'=>"locale",'id'=>"locale",'from'=>$_smarty_tpl->tpl_vars['filterData']->value['localeOptions'],'selected'=>$_smarty_tpl->tpl_vars['filterSelectionData']->value['locale'],'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['SMALL'],'translate'=>false,'inline'=>"true"),$_smarty_tpl ) );?>

		<?php $_block_repeat=false;
echo $_block_plugin2->smartyFBVFormSection(array('title'=>"plugins.generic.customLocale.search.fileName",'for'=>"search"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvFormButtons'][0], array( array('hideCancel'=>true,'submitText'=>"common.search"),$_smarty_tpl ) );?>

	<?php $_block_repeat=false;
echo $_block_plugin1->smartyFBVFormArea(array('id'=>"userSearchFormArea"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</form>
<?php }
}
