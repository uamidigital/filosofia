<?php
/* Smarty version 4.1.0, created on 2023-06-07 22:20:28
  from 'app:controllersgridtaskstask.' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6480e68c2f4f28_21812589',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '642608917fb21577c3f7235b556979f3e7c86b25' => 
    array (
      0 => 'app:controllersgridtaskstask.',
      1 => 1684945243,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6480e68c2f4f28_21812589 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="task<?php if (!$_smarty_tpl->tpl_vars['notification']->value->getDateRead()) {?> unread<?php }?>">
	<span class="message">
		<?php echo $_smarty_tpl->tpl_vars['message']->value;?>

	</span>
	<div class="details">
		<?php if ($_smarty_tpl->tpl_vars['isMultiContext']->value) {?>
			<span class="acronym">
				<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['context']->value->getLocalizedAcronym() ));?>

			</span>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['notificationObjectTitle']->value && $_smarty_tpl->tpl_vars['notificationObjectTitle']->value !== '—') {?>
			<span class="submission">
				<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['notificationObjectTitle']->value ));?>

			</span>
		<?php }?>
	</div>
</div>
<?php }
}
