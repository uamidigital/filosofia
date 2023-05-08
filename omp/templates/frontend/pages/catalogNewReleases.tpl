{**
 * templates/frontend/pages/catalogNewReleases.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view new release in the catalog.
 *
 * @uses $publishedSubmissions array List of published submissions in this category
 *}
{include file="frontend/components/header.tpl" pageTitle="catalog.newReleases"}

<div class="page page_catalog_new_releases">

	{* Breadcrumb *}
	{include file="frontend/components/breadcrumbs_catalog.tpl" currentTitleKey="catalog.newReleases"}
	<h1>{translate key="catalog.newReleases"}</h1>

	{* Count of new releases being dispalyed *}
	<div class="monograph_count">
		{translate key="catalog.browseTitles" numTitles=$publishedSubmissions|@count}
	</div>

	{* No published titles in this category *}
	{if empty($publishedSubmissions)}
		<p>{translate key="catalog.noTitlesNew"}</p>

	{else}
		{include file="frontend/components/monographList.tpl" monographs=$publishedSubmissions}

	{/if}

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
