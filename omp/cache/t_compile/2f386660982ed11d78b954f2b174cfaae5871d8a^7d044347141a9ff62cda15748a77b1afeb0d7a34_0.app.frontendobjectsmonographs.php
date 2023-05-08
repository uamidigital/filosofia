<?php
/* Smarty version 4.1.0, created on 2023-05-08 22:38:31
  from 'app:frontendobjectsmonographs' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_64595dc70d0024_47715851',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7d044347141a9ff62cda15748a77b1afeb0d7a34' => 
    array (
      0 => 'app:frontendobjectsmonographs',
      1 => 1675470241,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_64595dc70d0024_47715851 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Applications/XAMPP/xamppfiles/htdocs/filoso/omp/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>
<div class="obj_monograph_summary<?php if ($_smarty_tpl->tpl_vars['isFeatured']->value) {?> is_featured<?php }?>">
		<a <?php if ($_smarty_tpl->tpl_vars['press']->value) {?>href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('press'=>$_smarty_tpl->tpl_vars['press']->value->getPath(),'page'=>"catalog",'op'=>"book",'path'=>$_smarty_tpl->tpl_vars['monograph']->value->getBestId()),$_smarty_tpl ) );?>
"<?php } else { ?>href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"catalog",'op'=>"book",'path'=>$_smarty_tpl->tpl_vars['monograph']->value->getBestId()),$_smarty_tpl ) );?>
"<?php }?> class="cover">
			<?php $_smarty_tpl->_assignInScope('coverImage', $_smarty_tpl->tpl_vars['monograph']->value->getCurrentPublication()->getLocalizedData('coverImage'));?>
			<img
				src="<?php echo $_smarty_tpl->tpl_vars['monograph']->value->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($_smarty_tpl->tpl_vars['monograph']->value->getData('contextId'));?>
"
				alt="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['coverImage']->value['altText'] )) ?? null)===null||$tmp==='' ? '' ?? null : $tmp);?>
"
			>
		</a>
		<?php if ($_smarty_tpl->tpl_vars['monograph']->value->getSeriesPosition()) {?>
			<div class="seriesPosition">
				<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['monograph']->value->getSeriesPosition() ));?>

			</div>
		<?php }?>
		<<?php echo $_smarty_tpl->tpl_vars['heading']->value;?>
 class="title">
			<a <?php if ($_smarty_tpl->tpl_vars['press']->value) {?>href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('press'=>$_smarty_tpl->tpl_vars['press']->value->getPath(),'page'=>"catalog",'op'=>"book",'path'=>$_smarty_tpl->tpl_vars['monograph']->value->getBestId()),$_smarty_tpl ) );?>
"<?php } else { ?>href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"catalog",'op'=>"book",'path'=>$_smarty_tpl->tpl_vars['monograph']->value->getBestId()),$_smarty_tpl ) );?>
"<?php }?>>
				<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['monograph']->value->getLocalizedFullTitle() ));?>

			</a>
		</<?php echo $_smarty_tpl->tpl_vars['heading']->value;?>
>
		<div class="author">
			<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['monograph']->value->getAuthorOrEditorString() ));?>

		</div>
		<div class="date">
			<?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['monograph']->value->getDatePublished(),$_smarty_tpl->tpl_vars['dateFormatLong']->value);?>

		</div>
</div><!-- .obj_monograph_summary -->
<?php }
}
