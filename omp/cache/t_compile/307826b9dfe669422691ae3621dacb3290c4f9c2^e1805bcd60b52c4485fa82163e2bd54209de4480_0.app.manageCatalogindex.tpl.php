<?php
/* Smarty version 4.1.0, created on 2023-06-27 23:35:00
  from 'app:manageCatalogindex.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_649b560478d864_78966310',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e1805bcd60b52c4485fa82163e2bd54209de4480' => 
    array (
      0 => 'app:manageCatalogindex.tpl',
      1 => 1687207331,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_649b560478d864_78966310 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_1488343181649b5604781049_22936581', "page");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "layouts/backend.tpl");
}
/* {block "page"} */
class Block_1488343181649b5604781049_22936581 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_1488343181649b5604781049_22936581',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<h1 class="app__pageHeading">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.catalog"),$_smarty_tpl ) );?>

	</h1>

	<?php if (array_intersect(array(ROLE_ID_MANAGER),$_smarty_tpl->tpl_vars['userRoles']->value)) {?>
		<?php $_smarty_tpl->_assignInScope('isManager', true);?>
	<?php }?>

	<tabs :track-history="true">
		<tab id="monographs" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.catalog.allMonographs"),$_smarty_tpl ) );?>
">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"catalog",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<catalog-list-panel
				v-bind="components.catalog"
				@set="set"
			/>
		</tab>
		<?php if ($_smarty_tpl->tpl_vars['isManager']->value) {?>
			<tab id="spotlights" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"spotlight.spotlights"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"catalog",'section'=>"spotlights",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

				<div class="pkp_content_panel">
					<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'spotlightsGridUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"grid.content.spotlights.ManageSpotlightsGridHandler",'op'=>"fetchGrid",'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_url_in_div'][0], array( array('id'=>"spotlightsGridContainer",'url'=>$_smarty_tpl->tpl_vars['spotlightsGridUrl']->value),$_smarty_tpl ) );?>

				</div>
			</tab>
		<?php }?>
	</tabs>
<?php
}
}
/* {/block "page"} */
}
