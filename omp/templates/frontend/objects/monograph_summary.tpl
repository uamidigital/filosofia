{**
 * templates/frontend/objects/monograph_summary.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of a monograph for display in lists
 *
 * @uses $monograph Monograph The monograph to be displayed
 * @uses $isFeatured bool Is this a featured monograph?
 *}
 <div class="obj_monograph_summary{if $isFeatured} is_featured{/if}">
 
 <div class="container5">
	<main>
		<div class = "card">
			<img src="{$monograph->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}" alt="{$coverImage.altText|escape|default:''}">
			<div class="card-content">
				<h2 {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if}>
					{$monograph->getLocalizedFullTitle()|escape} 
				</h2>
				<p>
					{$monograph->getAuthorOrEditorString()|escape}
					{$monograph->getDatePublished()|date_format:$dateFormatLong}
				</p>
				<a class="button" {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if} class="cover">
					{assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
					ver <span class="material-symbols-outlined">
						arrow_right_alt
				</a>
			</div>
		</div>
	</main>
</div>


		
		{*<a class="button" {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if} class="cover">
			{assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
			<span class="material-symbols-outlined">
				  arrow_right_alt
		</a>
		{if $monograph->getSeriesPosition()}
			<div class="seriesPosition">
				{$monograph->getSeriesPosition()|escape}
			</div>
		{/if}
		<{$heading} class="title">
			<a {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if}>
				{$monograph->getLocalizedFullTitle()|escape} 
			</a>
		</{$heading}>
		<div class="author">
			{$monograph->getAuthorOrEditorString()|escape}
		</div>
		<div class="date">
			{$monograph->getDatePublished()|date_format:$dateFormatLong}
		</div>**}
</div>
		
		



  

<!-- .obj_monograph_summary -->
