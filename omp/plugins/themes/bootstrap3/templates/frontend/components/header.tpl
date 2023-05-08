{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	
	<div class="pkp_structure_page">

		<nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
			<ul>
			  <li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
			  <li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
			  <li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
			</ul>
		</nav>

		{* Header *}
		<header class="navbar navbar-default" id="headerNavigationContainer" role="banner" style="background-color: #242424; color: white;">

			{* User profile, login, etc, navigation menu*}
			<div class="container-fluid" style="color: whitesmoke;">
				<div class="row">
					<nav aria-label="{translate|escape key="common.navigation.user"}" style="color: whitesmoke;">
						{load_menu name="user" id="navigationUser" ulClass="nav nav-pills tab-list pull-right"}
					</nav>
				</div><!-- .row -->
			</div><!-- .container-fluid -->

			<div class="container-fluid">

				<div class="navbar-header">


					{* Logo or site title. Only use <h1> heading on the homepage.
					   Otherwise that should go to the page title. *}
					{if $requestedOp == 'index'}
						<h1 class="site-name">
					{else}
						<div class="site-name">
					{/if}
						{capture assign="homeUrl"}
							{url page="index" router=$smarty.const.ROUTE_PAGE}
						{/capture}
						{if $displayPageHeaderLogo}
							<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo" style="color: white;">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if}>
							</a>
						{elseif $displayPageHeaderTitle}
							<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
						{else}
							<a href="{$homeUrl}" class="navbar-brand">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
							</a>
						{/if}
					{if $requestedOp == 'index'}
						</h1>
					{else}
						</div>
					{/if}

				</div>

				{* Primary site navigation *}


			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{capture assign="primaryMenu"}
			{load_menu name="primary" id="main-navigation" ulClass="foxnav-items" liClass="foxnav-item"}
		{/capture}

		{* Mobile hamburger menu *}
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false" aria-controls="nav-menu" style="color: #56a51a;">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>


		{if !empty(trim($primaryMenu)) || $currentContext}
			<div class="container" style="background-color: whitesmoke;">
			<div class="text-left">
			{* Homepage Image *}
			{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
			<a href="">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}" width="240"height="240">
			</a>
			</div>
			<div class="text-right">
			<nav id="nav-menu" class="" aria-label="{translate|escape key="common.navigation.site"}">
			{/if}
				{* Primary navigation menu for current application *}
					{$primaryMenu}
			</nav>
			</div>
			</div>
							{* Search form 
							{if $currentContext}
								<div class="pull-md-right">
									{include file="frontend/components/searchForm_simple.tpl"}
								</div>
							{/if}
							<br/>*}
		{/if}
		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">
