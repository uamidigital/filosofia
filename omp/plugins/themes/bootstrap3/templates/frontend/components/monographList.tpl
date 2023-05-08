{**
* templates/frontend/components/monographList.tpl
*
* Copyright (c) 2014-2021 Simon Fraser University
* Copyright (c) 2003-2021 John Willinsky
* Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
*
* @brief Display a list of monographs.
*
* @uses $monographs array List of monographs to display
* @uses $featured array Optional list of monograph IDs to feature in the list
* @uses $titleKey string Optional translation key for a title for the list
* @uses $heading string HTML heading element, default: h2
*}
{if !$heading}
{assign var="heading" value="h2"}
{/if}
{if !$titleKey}
{assign var="monographHeading" value=$heading}
{elseif $heading == 'h2'}
{assign var="monographHeading" value="h3"}
{elseif $heading == 'h3'}
{assign var="monographHeading" value="h4"}
{else}
{assign var="monographHeading" value="h5"}
{/if}

<div class="cmp_monographs_list">
    <div class="container">
        <div class="row">
            
                {assign var=counter value=1}
                {foreach name="monographListLoop" from=$monographs item=monograph}
				<div class="col-md-4">
                {include file="frontend/objects/monograph_summary.tpl" monograph=$monograph isFeatured=$isFeatured
                heading=$monographHeading}
				</div>
                {/foreach}
                {* Close .row if we have an odd number of titles *}
            
        </div>
    </div>

    {* Optional title *}
    {if $titleKey}
    <{$heading} class="title">
        {translate key=$titleKey}
    </{$heading}>
    {/if}


</div>