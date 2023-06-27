<?php
/* Smarty version 4.1.0, created on 2023-06-27 07:51:55
  from 'app:frontendcomponentsdownloa' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_649a78fb3ad812_81429766',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '45f8151317118f2d351dc91cc14e161f7446f6c2' => 
    array (
      0 => 'app:frontendcomponentsdownloa',
      1 => 1687453173,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_649a78fb3ad812_81429766 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('publicationFormatId', $_smarty_tpl->tpl_vars['publicationFormat']->value->getBestId());?>

<?php if ($_smarty_tpl->tpl_vars['publication']->value->getId() === $_smarty_tpl->tpl_vars['monograph']->value->getCurrentPublication()->getId()) {?>
	<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'downloadUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"view",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['monograph']->value->getBestId(),$_smarty_tpl->tpl_vars['publicationFormatId']->value,$_smarty_tpl->tpl_vars['downloadFile']->value->getBestId() ))),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);
} else { ?>
	<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'downloadUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"view",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['monograph']->value->getBestId(),"version",$_smarty_tpl->tpl_vars['publication']->value->getId(),$_smarty_tpl->tpl_vars['publicationFormatId']->value,$_smarty_tpl->tpl_vars['downloadFile']->value->getBestId() ))),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);
}?>

<a href="<?php echo $_smarty_tpl->tpl_vars['downloadUrl']->value;?>
" class="cmp_download_link">
	<?php if ($_smarty_tpl->tpl_vars['useFilename']->value) {?>
		<?php echo $_smarty_tpl->tpl_vars['downloadFile']->value->getLocalizedData('name');?>

	<?php } else { ?>
		<?php if ($_smarty_tpl->tpl_vars['downloadFile']->value->getDirectSalesPrice() && $_smarty_tpl->tpl_vars['currency']->value) {
echo $_smarty_tpl->tpl_vars['downloadFile']->value->getDirectSalesPrice();?>

			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"payment.directSales.purchase",'format'=>$_smarty_tpl->tpl_vars['publicationFormat']->value->getLocalizedName(),'amount'=>$_smarty_tpl->tpl_vars['downloadFile']->value->getDirectSalesPrice(),'currency'=>$_smarty_tpl->tpl_vars['currency']->value->getLetterCode()),$_smarty_tpl ) );?>

		<?php } else { ?>
			<?php echo $_smarty_tpl->tpl_vars['publicationFormat']->value->getLocalizedName();?>

		<?php }?>
	<?php }?>
</a>
<?php }
}
