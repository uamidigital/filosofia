<?php
/* Smarty version 4.1.0, created on 2023-06-28 01:29:55
  from 'app:controllersgridcommoncell' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_649b70f30c8433_24029095',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9b48fc0c3cda275d2e1eafee1e2f5a6dd7e5cc7a' => 
    array (
      0 => 'app:controllersgridcommoncell',
      1 => 1687207329,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:linkAction/linkAction.tpl' => 1,
  ),
),false)) {
function content_649b70f30c8433_24029095 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('cellId', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'concat' ][ 0 ], array( "cell-",$_smarty_tpl->tpl_vars['id']->value )));?>
<span id="<?php echo $_smarty_tpl->tpl_vars['cellId']->value;?>
" class="pkp_linkActions">
	<?php if (count($_smarty_tpl->tpl_vars['actions']->value) > 0) {?>
		<?php $_smarty_tpl->_assignInScope('defaultCellAction', $_smarty_tpl->tpl_vars['actions']->value[0]);?>
				<?php $_smarty_tpl->_subTemplateRender("app:linkAction/linkAction.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('action'=>$_smarty_tpl->tpl_vars['defaultCellAction']->value,'contextId'=>$_smarty_tpl->tpl_vars['cellId']->value,'imageClass'=>"task"), 0, false);
?>
	<?php } elseif ($_smarty_tpl->tpl_vars['status']->value) {?>
		<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "statusTitle", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'concat' ][ 0 ], array( "grid.task.status.",$_smarty_tpl->tpl_vars['status']->value ))),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
		<a title="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['statusTitle']->value ));?>
" class="task <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['status']->value ));?>
">status</a>
	<?php }?>
</span>
<?php }
}
