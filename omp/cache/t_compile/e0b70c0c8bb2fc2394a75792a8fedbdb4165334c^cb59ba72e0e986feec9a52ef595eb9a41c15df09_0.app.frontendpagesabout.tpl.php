<?php
/* Smarty version 4.1.0, created on 2023-05-16 20:26:46
  from 'app:frontendpagesabout.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6463cae6964fd9_58893895',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cb59ba72e0e986feec9a52ef595eb9a41c15df09' => 
    array (
      0 => 'app:frontendpagesabout.tpl',
      1 => 1683930615,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/searchForm_simple.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:common/frontend/footer.tpl' => 1,
  ),
),false)) {
function content_6463cae6964fd9_58893895 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"about.aboutContext"), 0, false);
?>

<div id="main-content" class="page page_about">
<br/>
<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/searchForm_simple.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<br/>

	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>"about.aboutContext"), 0, false);
?>

		<div class="page-header">
		<h1><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutContext"),$_smarty_tpl ) );?>
</h1>
	</div>
	
	<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('about');?>

</div><!-- .page -->

<br>
<br>
<br>
<br>

<?php $_smarty_tpl->_subTemplateRender("app:common/frontend/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>


<?php }
}
