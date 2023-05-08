<?php

/**
 * @file classes/monograph/Chapter.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class Chapter
 * @ingroup monograph
 * @see ChapterDAO
 *
 * @brief Describes a monograph chapter (or section)
 */

class Chapter extends DataObject {
	/**
	 * Constructor
	 */
	function __construct() {
		parent::__construct();
	}

	//
	// Get/set methods
	//

	/**
	 * Get localized data for this object.
	 *
	 * It selects the locale in the following order:
	 * - $preferredLocale
	 * - the user's current locale
	 * - the first locale we find data for
	 *
	 * @todo Chapters should have access to their publication's locale
	 *  and should fall back to that after the user's current locale
	 *  and before the last fall back to the first data available.
	 * @param string $key
	 * @param string $preferredLocale
	 * @return mixed
	 */
	public function getLocalizedData($key, $preferredLocale = null) {
		// 1. Preferred locale
		if ($preferredLocale && $this->getData($key, $preferredLocale)) {
			return $this->getData($key, $preferredLocale);
		}
		// 2. User's current locale
		if (!empty($this->getData($key, AppLocale::getLocale()))) {
			return $this->getData($key, AppLocale::getLocale());
		}
		// 3. The first locale we can find data for
		$data = $this->getData($key, null);
		foreach ((array) $data as $value) {
			if (!empty($value)) {
				return $value;
			}
		}

		return null;
	}

	/**
	 * Get the combined prefix, title and subtitle for all locales
	 * @return array
	 */
	function getFullTitles() {
		$allTitles = (array) $this->getData('title');
		$return = [];
		foreach ($allTitles as $locale => $title) {
			if (!$title) {
				continue;
			}
			$return[$locale] = $this->getLocalizedFullTitle($locale);
		}
		return $return;
	}

	/**
	 * Get the chapter full title (with title and subtitle).
	 * @param string $preferedLocale
	 * @return string
	 */
	function getLocalizedFullTitle($preferedLocale = null) {

		$fullTitle = $this->getLocalizedTitle($preferedLocale);

		if ($subtitle = $this->getLocalizedSubtitle($preferedLocale)) {
			$fullTitle = PKPString::concatTitleFields(array($fullTitle, $subtitle));
		}

		return $fullTitle;
	}

	/**
	 * Get localized title of a chapter.
	 */
	function getLocalizedTitle($preferedLocale = null) {
		return $this->getLocalizedData('title', $preferedLocale);
	}

	/**
	 * Get title of chapter (primary locale)
	 * @param $locale string
	 * @return string
	 */
	function getTitle($locale = null) {
		return $this->getData('title', $locale);
	}

	/**
	 * Set title of chapter
	 * @param $title string
	 * @param $locale string
	 */
	function setTitle($title, $locale = null) {
		return $this->setData('title', $title, $locale);
	}

	/**
	 * Get localized sub title of a chapter.
	 */
	function getLocalizedSubtitle($preferedLocale = null) {
		return $this->getLocalizedData('subtitle', $preferedLocale);
	}

	/**
	 * Get sub title of chapter (primary locale)
	 * @param $locale string
	 * @return string
	 */
	function getSubtitle($locale = null) {
		return $this->getData('subtitle', $locale);
	}

	/**
	 * Set sub title of chapter
	 * @param $subtitle string
	 * @param $locale string
	 */
	function setSubtitle($subtitle, $locale = null) {
		return $this->setData('subtitle', $subtitle, $locale);
	}

	/**
	 * Get sequence of chapter.
	 * @return float
	 */
	function getSequence() {
		return $this->getData('sequence');
	}

	/**
	 * Set sequence of chapter.
	 * @param $sequence float
	 */
	function setSequence($sequence) {
		return $this->setData('sequence', $sequence);
	}

	/**
	 * Get all authors of this chapter.
	 * @return DAOResultFactory Iterator of authors
	 */
	function getAuthors() {
		$chapterAuthorDao = DAORegistry::getDAO('ChapterAuthorDAO'); /* @var $chapterAuthorDao ChapterAuthorDAO */
		return $chapterAuthorDao->getAuthors($this->getData('publicationId'), $this->getId());
	}

	/**
	 * Get the author names for this chapter and return them as a string.
	 * @param $preferred boolean If the preferred public name should be used, if exist
	 * @return string
	 */
	function getAuthorNamesAsString($preferred = true) {
		$authorNames = array();
		$authors = $this->getAuthors();
		while ($author = $authors->next()) {
			$authorNames[] = $author->getFullName($preferred);
		}
		return join(', ', $authorNames);
	}

	/**
	 * Get stored public ID of the chapter.
	 * @param @literal $pubIdType string One of the NLM pub-id-type values or
	 * 'other::something' if not part of the official NLM list
	 * (see <http://dtd.nlm.nih.gov/publishing/tag-library/n-4zh0.html>). @endliteral
	 * @return int
	 */
	function getStoredPubId($pubIdType) {
		return $this->getData('pub-id::'.$pubIdType);
	}

	/**
	 * Set the stored public ID of the chapter.
	 * @param $pubIdType string One of the NLM pub-id-type values or
	 * 'other::something' if not part of the official NLM list
	 * (see <http://dtd.nlm.nih.gov/publishing/tag-library/n-4zh0.html>).
	 * @param $pubId string
	 */
	function setStoredPubId($pubIdType, $pubId) {
		$this->setData('pub-id::'.$pubIdType, $pubId);
	}

	/**
	 * @copydoc DataObject::getDAO()
	 */
	function getDAO() {
		return DAORegistry::getDAO('ChapterDAO');
	}

	/**
	 * Get abstract of chapter (primary locale)
	 * @param $locale string
	 * @return string
	 */
	function getAbstract($locale = null) {
		return $this->getData('abstract', $locale);
	}

	/**
	 * Set abstract of chapter
	 * @param $abstract string
	 * @param $locale string
	 */
	function setAbstract($abstract, $locale = null) {
		return $this->setData('abstract', $abstract, $locale);
	}
	/**
	 * Get localized abstract of a chapter.
	 */
	function getLocalizedAbstract() {
		return $this->getLocalizedData('abstract');
	}

	/**
	 * get date published
	 * @return date
	 */
	function getDatePublished() {
		return $this->getData('datePublished');
	}

	/**
	 * set date published
	 * @param $datePublished date
	 */
	function setDatePublished($datePublished) {
		return $this->setData('datePublished', $datePublished);
	}

	/**
	 * get pages
	 * @return string
	 */
	function getPages() {
		return $this->getData('pages');
	}

	/**
	 * set pages
	 * @param $pages string
	 */
	function setPages($pages) {
		$this->setData('pages', $pages);
	}
}


