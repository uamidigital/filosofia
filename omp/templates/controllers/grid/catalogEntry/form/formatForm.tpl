{**
 * templates/controllers/grid/catalogEntry/form/formatForm.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Assigned Publication Format form.
 *}
{if $remoteURL}
	{assign var="remoteRepresentation" value=true}
{else}
	{assign var="remoteRepresentation" value=false}
{/if}
<script type="text/javascript">
	$(function() {ldelim}
		// Attach the form handler.
		$('#addPublicationFormatForm').pkpHandler('$.pkp.controllers.grid.representations.form.RepresentationFormHandler',
			{ldelim}
				remoteRepresentation: {$remoteRepresentation|json_encode}
			{rdelim}
		);
	{rdelim});
</script>

<form class="pkp_form" id="addPublicationFormatForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT component="grid.catalogEntry.PublicationFormatGridHandler" op="updateFormat"}">
	{csrf}
	<input type="hidden" name="submissionId" value="{$submissionId|escape}" />
	<input type="hidden" name="representationId" value="{$representationId|escape}" />
	<input type="hidden" name="publicationId" value="{$publicationId|escape}" />
	{fbvFormArea id="addFormat" class="border" title="grid.catalogEntry.publicationFormatDetails"}
		{fbvFormSection for="title"}
			{fbvElement type="text" required="true" id="name" label="common.name" value=$name multilingual="true" size=$fbvStyles.size.MEDIUM inline=true}
			{fbvElement type="select" label="grid.catalogEntry.publicationFormatType" from=$entryKeys selected=$entryKey id="entryKey" translate=false size=$fbvStyles.size.MEDIUM inline=true}
		{/fbvFormSection}
		{fbvFormSection for="publicationFormat" size=$fbvStyles.size.MEDIUM list=true}
			{fbvElement type="checkbox" label="grid.catalogEntry.physicalFormat" id="isPhysicalFormat" checked=$isPhysicalFormat}
		{/fbvFormSection}
		{fbvFormSection for="remotelyHostedContent" list=true}
			{fbvElement type="checkbox" label="grid.catalogEntry.remotelyHostedContent" id="remotelyHostedContent"}
			<div id="remote" style="display:none">
				{fbvElement type="url" id="remoteURL" label="grid.catalogEntry.remoteURL" value=$remoteURL}
			</div>
		{/fbvFormSection}
		{fbvFormSection id="urlPathSection" title="publication.urlPath"}
			{fbvElement type="text" label="publication.urlPath.description" value=$urlPath id="urlPath" size=$fbvStyles.size.MEDIUM inline=true}
		{/fbvFormSection}
	{/fbvFormArea}
	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
	{fbvFormButtons}
</form>