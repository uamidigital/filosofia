<?php

/**
 * @file classes/submission/SubmissionDAO.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class SubmissionDAO
 * @ingroup submission
 * @see Submission
 *
 * @brief Operations for retrieving and modifying Monograph objects.
 */

import('classes.submission.Submission');
import('lib.pkp.classes.submission.PKPSubmissionDAO');

define('ORDERBY_SERIES_POSITION', 'seriesPosition');

class SubmissionDAO extends PKPSubmissionDAO {

	/** @copydoc SchemaDAO::$primaryTableColumns */
	public $primaryTableColumns = [
		'id' => 'submission_id',
		'contextId' => 'context_id',
		'currentPublicationId' => 'current_publication_id',
		'dateLastActivity' => 'date_last_activity',
		'dateSubmitted' => 'date_submitted',
		'lastModified' => 'last_modified',
		'locale' => 'locale',
		'stageId' => 'stage_id',
		'status' => 'status',
		'submissionProgress' => 'submission_progress',
		'workType' => 'work_type',
	];

	/**
	 * Get a new data object representing the monograph.
	 * @return Submission
	 */
	public function newDataObject() {
		return new Submission();
	}

	/**
	 * @copydoc PKPSubmissionDAO::deleteById
	 */
	function deleteById($submissionId) {
		parent::deleteById($submissionId);

		// Delete references to features or new releases.
		$featureDao = DAORegistry::getDAO('FeatureDAO'); /* @var $featureDao FeatureDAO */
		$featureDao->deleteByMonographId($submissionId);

		$newReleaseDao = DAORegistry::getDAO('NewReleaseDAO'); /* @var $newReleaseDao NewReleaseDAO */
		$newReleaseDao->deleteByMonographId($submissionId);

		$monographSearchIndex = Application::getSubmissionSearchIndex();
		$monographSearchIndex->deleteTextIndex($submissionId);
		$monographSearchIndex->submissionChangesFinished();
	}

	/**
	 * Get possible sort options.
	 * @return array
	 */
	public function getSortSelectOptions() {
		return array_merge(parent::getSortSelectOptions(), array(
			$this->getSortOption(ORDERBY_SERIES_POSITION, SORT_DIRECTION_ASC) => __('catalog.sortBy.seriesPositionAsc'),
			$this->getSortOption(ORDERBY_SERIES_POSITION, SORT_DIRECTION_DESC) => __('catalog.sortBy.seriesPositionDesc'),
		));
	}
}

