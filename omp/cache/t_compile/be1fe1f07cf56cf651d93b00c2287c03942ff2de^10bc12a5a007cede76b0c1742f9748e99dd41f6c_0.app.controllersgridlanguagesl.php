<?php
/* Smarty version 4.1.0, created on 2023-06-22 01:22:11
  from 'app:controllersgridlanguagesl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_64938623bfa9f1_46294324',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '10bc12a5a007cede76b0c1742f9748e99dd41f6c' => 
    array (
      0 => 'app:controllersgridlanguagesl',
      1 => 1687207329,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_64938623bfa9f1_46294324 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['id']->value) {?>
	<?php $_smarty_tpl->_assignInScope('cellId', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'concat' ][ 0 ], array( "cell-",$_smarty_tpl->tpl_vars['id']->value )));
} else { ?>
	<?php $_smarty_tpl->_assignInScope('cellId', '');
}?>
<span <?php if ($_smarty_tpl->tpl_vars['cellId']->value) {?>id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['cellId']->value ));?>
" <?php }?>class="gridCellContainer">
	<?php echo $_smarty_tpl->tpl_vars['label']->value;?>

</span>
<?php if ($_smarty_tpl->tpl_vars['incomplete']->value) {?>
	<span class="pkp_form_error">*</span>
<?php }?>


<?php }
}
