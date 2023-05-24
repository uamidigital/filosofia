{**
 * plugins/generic/webFeed/templates/rss2.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * RSS 2 feed template
 *
 *}
<?xml version="1.0" encoding="{$defaultCharset|escape}"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">
	<channel>
		{* required elements *}
		<title>{$currentPress->getLocalizedName()|strip|escape:"html"}</title>
		<link>{url press=$currentPress->getPath()}</link>

		{if $currentPress->getLocalizedDescription()}
			{assign var="description" value=$currentPress->getLocalizedDescription()}
		{elseif $currentPress->getLocalizedSetting('searchDescription')}
			{assign var="description" value=$currentPress->getLocalizedSetting('searchDescription')}
		{/if}

		<description>{$description|strip|escape:"html"}</description>

		{* optional elements *}
		{if $currentPress->getPrimaryLocale()}
			<language>{$currentPress->getPrimaryLocale()|replace:'_':'-'|strip|escape:"html"}</language>
		{/if}

		{if $currentPress->getLocalizedSetting('copyrightNotice')}
			<copyright>{$currentPress->getLocalizedSetting('copyrightNotice')|strip|escape:"html"}</copyright>
		{/if}

		{if $currentPress->getSetting('contactEmail')}
			<managingEditor>{$currentPress->getSetting('contactEmail')|strip|escape:"html"}{if $currentPress->getSetting('contactName')} ({$currentPress->getSetting('contactName')|strip|escape:"html"}){/if}</managingEditor>
		{/if}

		{if $currentPress->getSetting('supportEmail')}
			<webMaster>{$currentPress->getSetting('supportEmail')|strip|escape:"html"}{if $currentPress->getSetting('contactName')} ({$currentPress->getSetting('supportName')|strip|escape:"html"}){/if}</webMaster>
		{/if}

		{* <lastBuildDate/> *}
		{* <category/> *}
		{* <creativeCommons:license/> *}

		<generator>OMP {$ompVersion|escape}</generator>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		<ttl>60</ttl>

		{foreach name=submissions from=$submissions item=submission}
			<item>
				{* required elements *}
				<title>{$submission->getLocalizedTitle()|strip|escape:"html"}</title>
				<link>{url page="catalog" op="book" path=$submission->getId()}</link>
				<description>{$submission->getLocalizedAbstract()|strip|escape:"html"}</description>

				{* optional elements *}
				<author>{$submission->getAuthorString()|escape:"html"}</author>
				{* <category/> *}
				{* <comments/> *}
				{* <source/> *}

				<dc:rights>
					{translate|escape key="submission.copyrightStatement" copyrightYear=$submission->getCopyrightYear() copyrightHolder=$submission->getLocalizedCopyrightHolder()}
					{$submission->getLicenseURL()|escape}
				</dc:rights>

				<guid isPermaLink="true">{url page="catalog" op="book" path=$submission->getId()}</guid>
				{capture assign="datePublished"}{$submission->getDatePublished()|strtotime}{/capture}
				<pubDate>{$smarty.const.DATE_RSS|date:$datePublished}</pubDate>
			</item>
		{/foreach}{* submissions *}
	</channel>
</rss>
