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
    {assign var="currentTitleKey" value=""}
    {assign var="groupCounter" value=0}

    {foreach name="monographListLoop" from=$monographs item=monograph}
        {if is_array($featured) && array_key_exists($monograph->getId(), $featured)}
            {assign var="isFeatured" value=true}
        {else}
            {assign var="isFeatured" value=false}
        {/if}

        {if $titleKey != $currentTitleKey}
            {assign var="currentTitleKey" value=$titleKey}
            {if $currentTitleKey}
                <{$heading} class="title">
                    {translate key=$currentTitleKey}
                </{$heading}>
            {/if}
            {assign var="groupCounter" value=1}
            <div class="contenido">
        {else}
            {assign var="groupCounter" value=$groupCounter+1}
        {/if}

        <div class="columna">
            {include file="frontend/objects/monograph_summary.tpl" monograph=$monograph isFeatured=$isFeatured heading=$monographHeading}
        </div>

        {if $groupCounter % 3 == 0}
            </div>
            {if $titleKey != $currentTitleKey || $groupCounter < $counter}
                <div class="contenido">
            {/if}
        {/if}
    {/foreach}

    {if $groupCounter % 3 != 0}
        </div>
    {/if}

</div>


