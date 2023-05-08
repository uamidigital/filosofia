<?php

/**
 * @defgroup submission Monographs
 */

/**
 * @file classes/submission/Submission.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class Submission
 * @ingroup submission
 * @see SubmissionDAO
 *
 * @brief Class for a Submission.
 */

define('WORK_TYPE_EDITED_VOLUME', 1);
define('WORK_TYPE_AUTHORED_WORK', 2);

import('lib.pkp.classes.submission.PKPSubmission');
import('classes.monograph.Author');

class Submission extends PKPSubmission {
	/**
	 * get press id
	 * @return int
	 * @deprecated 3.2.0.0
	 */
	function getPressId() {
		return $this->getContextId();
	}

	/**
	 * set press id
	 * @param $pressId int
	 * @deprecated 3.2.0.0
	 */
	function setPressId($pressId) {
		return $this->setContextId($pressId);
	}

	/**
	 * Get the series id.
	 * @return int
	 * @deprecated 3.2.0.0
	 */
	function getSeriesId() {
		return $this->getSectionId();
	}

	/**
	 * @see Submission::getSectionId()
	 * @deprecated 3.2.0.0
	 */
	function getSectionId() {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return 0;
		}
		return $publication->getData('seriesId');
	}

	/**
	 * Set the series id.
	 * @param $id int
	 * @deprecated 3.2.0.0
	 */
	function setSeriesId($id) {
		$publication = $this->getCurrentPublication();
		if ($publication) {
			$publication->setData('seriesId', $id);
		}
	}

	/**
	 * Get the position of this monograph within a series.
	 * @return string
	 * @deprecated 3.2.0.0
	 */
	function getSeriesPosition() {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return '';
		}
		return $publication->getData('seriesPosition');
	}

	/**
	 * Set the series position for this monograph.
	 * @param $seriesPosition string
	 * @deprecated 3.2.0.0
	 */
	function setSeriesPosition($seriesPosition) {
		$publication = $this->getCurrentPublication();
		if ($publication) {
			$publication->setData('seriesPosition', $seriesPosition);
		}
	}

	/**
	 * Get the work type (constant in WORK_TYPE_...)
	 * @return int
	 * @deprecated 3.2.0.0
	 */
	function getWorkType() {
		return $this->getData('workType');
	}

	/**
	 * Set the work type (constant in WORK_TYPE_...)
	 * @param $workType int
	 * @deprecated 3.2.0.0
	 */
	function setWorkType($workType) {
		$this->setData('workType', $workType);
	}

	/**
	 * Get localized supporting agencies array.
	 * @return array
	 * @deprecated 3.2.0.0
	 */
	function getLocalizedSupportingAgencies() {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return [];
		}
		return $publication->getLocalizedData('supportingAgencies');
	}

	/**
	 * Get supporting agencies.
	 * @param $locale
	 * @return array
	 * @deprecated 3.2.0.0
	 */
	function getSupportingAgencies($locale) {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return [];
		}
		return $publication->getData('supportingAgencies', $locale);
	}

	/**
	 * Set supporting agencies.
	 * @param $supportingAgencies array
	 * @param $locale
	 * @deprecated 3.2.0.0
	 */
	function setSupportingAgencies($supportingAgencies, $locale) {
		$publication = $this->getCurrentPublication();
		if ($publication) {
			$publication->setData('seriesPosition', $supportingAgencies, $locale);
		}
	}

	/**
	 * Get the value of a license field from the containing context.
	 * @param $locale string Locale code
	 * @param $field PERMISSIONS_FIELD_...
	 * @param $publication Publication
	 * @return string|array|null
	 */
	function _getContextLicenseFieldValue($locale, $field, $publication = null) {
		$context = Services::get('context')->get($this->getData('contextId'));
		$fieldValue = null; // Scrutinizer
		switch ($field) {
			case PERMISSIONS_FIELD_LICENSE_URL:
				$fieldValue = $context->getData('licenseUrl');
				break;
			case PERMISSIONS_FIELD_COPYRIGHT_HOLDER:
				switch($context->getData('copyrightHolderType')) {
					case 'author':
						$fieldValue = array($context->getPrimaryLocale() => $this->getAuthorString());
						break;
					case 'context':
					case null:
						$fieldValue = $context->getName(null);
						break;
					default:
						$fieldValue = $context->getData('copyrightHolderOther');
						break;
				}
				break;
			case PERMISSIONS_FIELD_COPYRIGHT_YEAR:
				$fieldValue = date('Y');
				if (!$publication) {
					$publication = $this->getCurrentPublication();
				}
				if ($publication->getData('datePublished')) {
					$fieldValue = date('Y', strtotime($publication->getData('datePublished')));
				}
				break;
			default: assert(false);
		}

		// Return the fetched license field
		if ($locale === null) return $fieldValue;
		if (isset($fieldValue[$locale])) return $fieldValue[$locale];
		return null;
	}

	/**
	 * get cover page server-side file name
	 * @return string
	 * @deprecated 3.2.0.0
	 */
	function getCoverImage() {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return '';
		}
		return $publication->getData('coverImage');
	}

	/**
	 * get cover page alternate text
	 * @return string
	 * @deprecated 3.2.0.0
	 */
	function getCoverImageAltText() {
		$publication = $this->getCurrentPublication();
		if (!$publication) {
			return '';
		}
		$coverImage = $publication->getData('coverImage');
		return empty($coverImage['altText']) ? '' : $coverImage['altText'];
	}

	/**
	 * Get a string indicating all authors or, if it is an edited volume, editors.
	 * @param $preferred boolean If the preferred public name should be used, if exist
	 * @return string
	 * @deprecated 3.2.0.0
	 */
	public function getAuthorOrEditorString($preferred = true) {

		if ($this->getWorkType() != WORK_TYPE_EDITED_VOLUME) {
			$userGroupIds = array_map(function($author) {
				return $author->getData('userGroupId');
			}, $this->getAuthors(true));
			$userGroups = array_map(function($userGroupId) {
				return DAORegistry::getDAO('UserGroupDAO')->getbyId($userGroupId);
			}, array_unique($userGroupIds));
			return $this->getCurrentPublication()->getAuthorString($userGroups);
		}

		return $this->getCurrentPublication()->getEditorString();
	}

	/**
	 * get enableChapterPublicationDates status
	 * @return int
	 */
	function getEnableChapterPublicationDates() {
		return $this->getData('enableChapterPublicationDates');
	}

	/**
	 * set  enableChapterPublicationDates status
	 * @param $enableChapterPublicationDates int
	 */
	function setEnableChapterPublicationDates($enableChapterPublicationDates) {
		$this->setData('enableChapterPublicationDates', $enableChapterPublicationDates);
	}

}
