<?php
/* Smarty version 4.1.0, created on 2023-07-06 22:30:15
  from 'app:frontendcomponentsmonogra' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_64a7245744af72_92861556',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1740c2ec5409f96edca701e7e6e1d6b1d15d687f' => 
    array (
      0 => 'app:frontendcomponentsmonogra',
      1 => 1688675384,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/objects/monograph_summary.tpl' => 1,
  ),
),false)) {
function content_64a7245744af72_92861556 (Smarty_Internal_Template $_smarty_tpl) {
if (!$_smarty_tpl->tpl_vars['heading']->value) {?>
	<?php $_smarty_tpl->_assignInScope('heading', "h2");
}
if (!$_smarty_tpl->tpl_vars['titleKey']->value) {?>
	<?php $_smarty_tpl->_assignInScope('monographHeading', $_smarty_tpl->tpl_vars['heading']->value);
} elseif ($_smarty_tpl->tpl_vars['heading']->value == 'h2') {?>
	<?php $_smarty_tpl->_assignInScope('monographHeading', "h3");
} elseif ($_smarty_tpl->tpl_vars['heading']->value == 'h3') {?>
	<?php $_smarty_tpl->_assignInScope('monographHeading', "h4");
} else { ?>
	<?php $_smarty_tpl->_assignInScope('monographHeading', "h5");
}?>

<div class="cmp_monographs_list">
    <?php $_smarty_tpl->_assignInScope('currentTitleKey', '');?>
    <?php $_smarty_tpl->_assignInScope('groupCounter', 0);?>

    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['monographs']->value, 'monograph', false, NULL, 'monographListLoop', array (
));
$_smarty_tpl->tpl_vars['monograph']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['monograph']->value) {
$_smarty_tpl->tpl_vars['monograph']->do_else = false;
?>
        <?php if (is_array($_smarty_tpl->tpl_vars['featured']->value) && array_key_exists($_smarty_tpl->tpl_vars['monograph']->value->getId(),$_smarty_tpl->tpl_vars['featured']->value)) {?>
            <?php $_smarty_tpl->_assignInScope('isFeatured', true);?>
        <?php } else { ?>
            <?php $_smarty_tpl->_assignInScope('isFeatured', false);?>
        <?php }?>

        <?php if ($_smarty_tpl->tpl_vars['titleKey']->value != $_smarty_tpl->tpl_vars['currentTitleKey']->value) {?>
            <?php $_smarty_tpl->_assignInScope('currentTitleKey', $_smarty_tpl->tpl_vars['titleKey']->value);?>
            <?php if ($_smarty_tpl->tpl_vars['currentTitleKey']->value) {?>
                <<?php echo $_smarty_tpl->tpl_vars['heading']->value;?>
 class="title">
                    <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['currentTitleKey']->value),$_smarty_tpl ) );?>

                </<?php echo $_smarty_tpl->tpl_vars['heading']->value;?>
>
            <?php }?>
            <?php $_smarty_tpl->_assignInScope('groupCounter', 1);?>
            <div class="contenido">
        <?php } else { ?>
            <?php $_smarty_tpl->_assignInScope('groupCounter', $_smarty_tpl->tpl_vars['groupCounter']->value+1);?>
        <?php }?>

        <div class="columna">
            <?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/monograph_summary.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('monograph'=>$_smarty_tpl->tpl_vars['monograph']->value,'isFeatured'=>$_smarty_tpl->tpl_vars['isFeatured']->value,'heading'=>$_smarty_tpl->tpl_vars['monographHeading']->value), 0, true);
?>
        </div>

        <?php if ($_smarty_tpl->tpl_vars['groupCounter']->value%3 == 0) {?>
            </div>
            <?php if ($_smarty_tpl->tpl_vars['titleKey']->value != $_smarty_tpl->tpl_vars['currentTitleKey']->value || $_smarty_tpl->tpl_vars['groupCounter']->value < $_smarty_tpl->tpl_vars['counter']->value) {?>
                <div class="contenido">
            <?php }?>
        <?php }?>
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

    <?php if ($_smarty_tpl->tpl_vars['groupCounter']->value%3 != 0) {?>
        </div>
    <?php }?>

</div>


<?php }
}
