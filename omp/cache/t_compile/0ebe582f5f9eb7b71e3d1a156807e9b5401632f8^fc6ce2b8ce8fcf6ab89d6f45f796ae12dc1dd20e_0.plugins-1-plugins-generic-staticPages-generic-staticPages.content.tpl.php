<?php
/* Smarty version 4.1.0, created on 2023-06-07 21:59:12
  from 'plugins-1-plugins-generic-staticPages-generic-staticPages:content.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6480e190ecdd05_16198303',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fc6ce2b8ce8fcf6ab89d6f45f796ae12dc1dd20e' => 
    array (
      0 => 'plugins-1-plugins-generic-staticPages-generic-staticPages:content.tpl',
      1 => 1684945243,
      2 => 'plugins-1-plugins-generic-staticPages-generic-staticPages',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_6480e190ecdd05_16198303 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitleTranslated'=>$_smarty_tpl->tpl_vars['title']->value), 0, false);
?>

<div class="page">
	<h2><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['title']->value ));?>
</h2>
	<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

</div>

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
