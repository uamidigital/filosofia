{**
 * templates/submission/form/step3.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Step 3 of author monograph submission.
 *}
{capture assign="additionalContributorsFields"}
	<!--  Chapters -->
	{capture assign=chaptersGridUrl}{url router=$smarty.const.ROUTE_COMPONENT  component="grid.users.chapter.ChapterGridHandler" op="fetchGrid" submissionId=$submissionId publicationId=$publicationId escape=false}{/capture}
	{load_url_in_div id="chaptersGridContainer" url=$chaptersGridUrl}
{/capture}

{include file="core:submission/form/step3.tpl"}
