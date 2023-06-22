<?php
/* Smarty version 4.1.0, created on 2023-06-07 21:58:55
  from 'plugins-1-plugins-generic-staticPages-generic-staticPages:editStaticPageForm.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6480e17f0bab12_75231432',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '85f5894ad1883c1b76c1ac7627f836497bcd4f2b' => 
    array (
      0 => 'plugins-1-plugins-generic-staticPages-generic-staticPages:editStaticPageForm.tpl',
      1 => 1684945243,
      2 => 'plugins-1-plugins-generic-staticPages-generic-staticPages',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6480e17f0bab12_75231432 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/opt/lampp/htdocs/filosofia/omp/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['pluginJavaScriptURL']->value;?>
/StaticPageFormHandler.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
	$(function() {
		// Attach the form handler.
		$('#staticPageForm').pkpHandler(
			'$.pkp.controllers.form.staticPages.StaticPageFormHandler',
			{
				previewUrl: <?php echo json_encode(call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"pages",'op'=>"preview"),$_smarty_tpl ) ));?>

			}
		);
	});
<?php echo '</script'; ?>
>

<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'actionUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"plugins.generic.staticPages.controllers.grid.StaticPageGridHandler",'op'=>"updateStaticPage",'existingPageName'=>$_smarty_tpl->tpl_vars['blockName']->value,'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
<form class="pkp_form" id="staticPageForm" method="post" action="<?php echo $_smarty_tpl->tpl_vars['actionUrl']->value;?>
">
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

	<?php if ($_smarty_tpl->tpl_vars['staticPageId']->value) {?>
		<input type="hidden" name="staticPageId" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['staticPageId']->value ));?>
" />
	<?php }?>
	<?php $_block_plugin1 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormArea'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormArea'][0][0] : null;
if (!is_callable(array($_block_plugin1, 'smartyFBVFormArea'))) {
throw new SmartyException('block tag \'fbvFormArea\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormArea', array('id'=>"staticPagesFormArea",'class'=>"border"));
$_block_repeat=true;
echo $_block_plugin1->smartyFBVFormArea(array('id'=>"staticPagesFormArea",'class'=>"border"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php $_block_plugin2 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin2, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array());
$_block_repeat=true;
echo $_block_plugin2->smartyFBVFormSection(array(), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"text",'label'=>"plugins.generic.staticPages.path",'id'=>"path",'value'=>$_smarty_tpl->tpl_vars['path']->value,'maxlength'=>"40",'inline'=>true,'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM']),$_smarty_tpl ) );?>

			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"text",'label'=>"plugins.generic.staticPages.pageTitle",'id'=>"title",'value'=>$_smarty_tpl->tpl_vars['title']->value,'maxlength'=>"255",'inline'=>true,'multilingual'=>true,'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM']),$_smarty_tpl ) );?>

		<?php $_block_repeat=false;
echo $_block_plugin2->smartyFBVFormSection(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
		<?php $_block_plugin3 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin3, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array());
$_block_repeat=true;
echo $_block_plugin3->smartyFBVFormSection(array(), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "exampleUrl", null);
echo smarty_modifier_replace(call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'context'=>$_smarty_tpl->tpl_vars['currentContext']->value->getPath(),'page'=>"REPLACEME"),$_smarty_tpl ) ),"REPLACEME","%PATH%");
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.staticPages.viewInstructions",'pagesPath'=>$_smarty_tpl->tpl_vars['exampleUrl']->value),$_smarty_tpl ) );?>

		<?php $_block_repeat=false;
echo $_block_plugin3->smartyFBVFormSection(array(), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
		<?php $_block_plugin4 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin4, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('label'=>"plugins.generic.staticPages.content",'for'=>"content"));
$_block_repeat=true;
echo $_block_plugin4->smartyFBVFormSection(array('label'=>"plugins.generic.staticPages.content",'for'=>"content"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"textarea",'multilingual'=>true,'name'=>"content",'id'=>"content",'value'=>$_smarty_tpl->tpl_vars['content']->value,'rich'=>true,'height'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['height']['TALL'],'variables'=>$_smarty_tpl->tpl_vars['allowedVariables']->value),$_smarty_tpl ) );?>

		<?php $_block_repeat=false;
echo $_block_plugin4->smartyFBVFormSection(array('label'=>"plugins.generic.staticPages.content",'for'=>"content"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
	<?php $_block_repeat=false;
echo $_block_plugin1->smartyFBVFormArea(array('id'=>"staticPagesFormArea",'class'=>"border"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
	<?php $_block_plugin5 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin5, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('class'=>"formButtons"));
$_block_repeat=true;
echo $_block_plugin5->smartyFBVFormSection(array('class'=>"formButtons"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"button",'class'=>"pkp_helpers_align_left",'id'=>"previewButton",'label'=>"common.preview"),$_smarty_tpl ) );?>

		<?php $_smarty_tpl->_assignInScope('buttonId', uniqid(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'concat' ][ 0 ], array( "submitFormButton","-" ))));?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"submit",'class'=>"submitFormButton",'id'=>$_smarty_tpl->tpl_vars['buttonId']->value,'label'=>"common.save"),$_smarty_tpl ) );?>

	<?php $_block_repeat=false;
echo $_block_plugin5->smartyFBVFormSection(array('class'=>"formButtons"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>
</form>
<?php }
}
