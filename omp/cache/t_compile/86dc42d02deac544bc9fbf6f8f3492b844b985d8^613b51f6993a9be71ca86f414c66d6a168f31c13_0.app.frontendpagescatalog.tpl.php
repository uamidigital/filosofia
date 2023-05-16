<?php
/* Smarty version 4.1.0, created on 2023-05-16 20:27:01
  from 'app:frontendpagescatalog.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6463caf5cd4425_80364337',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '613b51f6993a9be71ca86f414c66d6a168f31c13' => 
    array (
      0 => 'app:frontendpagescatalog.tpl',
      1 => 1683930615,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:frontend/components/searchForm_simple.tpl' => 1,
    'app:frontend/components/monographList.tpl' => 1,
    'app:frontend/components/pagination.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_6463caf5cd4425_80364337 (Smarty_Internal_Template $_smarty_tpl) {
?> <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"navigation.catalog"), 0, false);
?>


 <div class="">
 <br/>
 <br/>


     <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>"navigation.catalog"), 0, false);
?>
     <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/searchForm_simple.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
     <div class="container">
     <div class="center">
        
     <div class="encabezados">
    <h4 class="ancla-superior">Ingresa tu búsqueda</h4>
    <div class="linea-titulo" id="linea_titulo"></div>
    </div>     
     </div>
     </div>
     <br/>
     
     <div class="encabezados">
    <h4 class="ancla-superior"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.catalog"),$_smarty_tpl ) );?>
</h4>
    <div class="linea-titulo" id="linea_titulo"></div>
    </div>

 
     <div class="monograph_count">
     <span class="badge badge-success" style="background-color: #56a51a;">
         <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"catalog.browseTitles",'numTitles'=>$_smarty_tpl->tpl_vars['total']->value),$_smarty_tpl ) );?>

     </span>
     </div>
     <br/>
 
          <?php if (!count($_smarty_tpl->tpl_vars['publishedSubmissions']->value)) {?>
         <h2>
             <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"catalog.category.heading"),$_smarty_tpl ) );?>

         </h2>
         <p><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"catalog.noTitles"),$_smarty_tpl ) );?>
</p>
 
          <?php } else { ?>
         <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/monographList.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('monographs'=>$_smarty_tpl->tpl_vars['publishedSubmissions']->value,'featured'=>$_smarty_tpl->tpl_vars['featuredMonographIds']->value), 0, false);
?>
 
                  <?php if ($_smarty_tpl->tpl_vars['prevPage']->value > 1) {?>
             <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'prevUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"catalog",'op'=>"page",'path'=>$_smarty_tpl->tpl_vars['prevPage']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
         <?php } elseif ($_smarty_tpl->tpl_vars['prevPage']->value === 1) {?>
             <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'prevUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"catalog"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
         <?php }?>
         <?php if ($_smarty_tpl->tpl_vars['nextPage']->value) {?>
             <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'nextUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"catalog",'op'=>"page",'path'=>$_smarty_tpl->tpl_vars['nextPage']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
         <?php }?>
         <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/pagination.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('prevUrl'=>$_smarty_tpl->tpl_vars['prevUrl']->value,'nextUrl'=>$_smarty_tpl->tpl_vars['nextUrl']->value,'showingStart'=>$_smarty_tpl->tpl_vars['showingStart']->value,'showingEnd'=>$_smarty_tpl->tpl_vars['showingEnd']->value,'total'=>$_smarty_tpl->tpl_vars['total']->value), 0, false);
?>
     <?php }?>
     <hr/>
 </div><!-- .page -->

 <br/>
 <br/>
 
 <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
 <?php }
}
