{**
 * templates/frontend/pages/book.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single book.
 *
 * @uses $representationId int Publication format ID
 * @uses $availableFiles array List of available MonographFiles
 * @uses $publishedSubmission PublishedSubmission The published submission object.
 * @uses $series Series The series this monograph is assigned to, if any.
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$publishedSubmission->getLocalizedFullTitle()}

<div class="page page_book">
	{* Display book details *}
	{include file="frontend/objects/monograph_full.tpl" monograph=$publishedSubmission}

	{call_hook name="Templates::Catalog::Book::Footer::PageFooter"}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
