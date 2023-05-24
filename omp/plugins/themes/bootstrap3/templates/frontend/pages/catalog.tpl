{**
 * templates/frontend/pages/catalog.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the catalog.
 *
 * @uses $publishedSubmissions array List of published submissions
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published submissions
 *}
 {include file="frontend/components/header.tpl" pageTitle="navigation.catalog"}


 <div class="">
 <br/>
 <br/>


     {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="navigation.catalog"}
     {include file="frontend/components/searchForm_simple.tpl"}
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
    <h4 class="ancla-superior">{translate key="navigation.catalog"}</h4>
    <div class="linea-titulo" id="linea_titulo"></div>
    </div>

 
     <div class="monograph_count">
     <span class="badge badge-success" style="background-color: #56a51a;">
         {translate key="catalog.browseTitles" numTitles=$total}
     </span>
     </div>
     <br/>
 
     {* No published titles *}
     {if !$publishedSubmissions|@count}
         <h2>
             {translate key="catalog.category.heading"}
         </h2>
         <p>{translate key="catalog.noTitles"}</p>
 
     {* Monograph List *}
     {else}
         {include file="frontend/components/monographList.tpl" monographs=$publishedSubmissions featured=$featuredMonographIds}
 
         {* Pagination *}
         {if $prevPage > 1}
             {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="page" path=$prevPage}{/capture}
         {elseif $prevPage === 1}
             {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog"}{/capture}
         {/if}
         {if $nextPage}
             {capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="page" path=$nextPage}{/capture}
         {/if}
         {include
             file="frontend/components/pagination.tpl"
             prevUrl=$prevUrl
             nextUrl=$nextUrl
             showingStart=$showingStart
             showingEnd=$showingEnd
             total=$total
         }
     {/if}
     <hr/>
 </div><!-- .page -->

 <br/>
 <br/>
 
 {include file="frontend/components/footer.tpl"}
 