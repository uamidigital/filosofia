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

{*<div class="a-box" style="margin-right: 55px;">
    <div class="img-container">
        <div class="img-inner">
            <div class="inner-skew">
                <a {if $press}href="{url press=$press->getPath() page=" catalog" op="book"
                    path=$monograph->getBestId()}"
                    {else}href="
                    {url page="catalog" op="book" path=$monograph->getBestId()}"
                    {/if}
                    class="cover">
                    {assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
                    <img src="{$monograph->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}"
                        alt="{$coverImage.altText|escape|default:''}">
                </a>
            </div>
        </div>
    </div>
    <div class="text-container">
        <h3 class="title">
            <a {if $press}href="{url press=$press->getPath() page=" catalog" op="book" path=$monograph->getBestId()}"
                {else}href="
                {url page="catalog" op="book" path=$monograph->getBestId()}"
                {/if}>
                {$monograph->getLocalizedFullTitle()|escape}
            </a>
        </h3>
        <div class="author">
            {$monograph->getAuthorOrEditorString()|escape}
        </div>
    </div>
</div>*}

<div class="card">
        <div class="image">
            <a {if $press}href="{url press=$press->getPath() page=" catalog" op="book" path=$monograph->getBestId()}"
                {else}href="
                {url page="catalog" op="book" path=$monograph->getBestId()}"
                {/if}
                class="cover">
                {assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
                <img src="{$monograph->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}"
                    alt="{$coverImage.altText|escape|default:''}">
            </a>
        </div>
        <div class="details">
            <div class="center">
            <h3 class="title">
                <a {if $press}href="{url press=$press->getPath() page=" catalog" op="book"
                    path=$monograph->getBestId()}"
                    {else}href="
                    {url page="catalog" op="book" path=$monograph->getBestId()}"
                    {/if} style="text-decoration: none; color: #56a51a;">
                    {$monograph->getLocalizedFullTitle()|escape}
                </a>
            </h3>
            <div class="author">
                {$monograph->getAuthorOrEditorString()|escape}
            </div>
            </div>  
        </div>
    </div>