{**
 * plugins/generic/webFeed/templates/block.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Feed plugin navigation sidebar.
 *
 *}
<div class="pkp_block block_web_feed">
	<h2 class="title">{translate key="plugins.generic.webfeed.newcontent"}</h2>
	<div class="content">
		<ul>
			<li>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"atom"}">
					<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/atom10_logo.gif" alt="{translate key="plugins.generic.webfeed.atom.altText"}">
				</a>
			</li>
			<li>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"rss2"}">
					<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/rss20_logo.gif" alt="{translate key="plugins.generic.webfeed.rss2.altText"}">
				</a>
			</li>
			<li>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"rss"}">
					<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/rss10_logo.gif" alt="{translate key="plugins.generic.webfeed.rss1.altText"}">
				</a>
			</li>
		</ul>
	</div>
</div>
