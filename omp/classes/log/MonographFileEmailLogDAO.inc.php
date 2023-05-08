<?php

/**
 * @file classes/log/MonographFileEmailLogDAO.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class MonographFileEmailLogDAO
 * @ingroup log
 * @see EmailLogDAO
 *
 * @brief Extension to EmailLogDAO for monograph file specific log entries.
 */

import('lib.pkp.classes.log.EmailLogDAO');
import('classes.log.MonographFileEmailLogEntry');

class MonographFileEmailLogDAO extends EmailLogDAO {
	/**
	 * Instantiate and return a MonographFileEmailLogEntry.
	 * @return MonographFileEmailLogEntry
	 */
	function newDataObject() {
		$returner = new MonographFileEmailLogEntry();
		$returner->setAssocType(ASSOC_TYPE_SUBMISSION_FILE);
		return $returner;
	}

	/**
	 * Get monograph file email log entries by file ID and event type.
	 * @param $fileId int
	 * @param $eventType int SUBMISSION_EMAIL_...
	 * @param $userId int optional Return only emails sent to this user.
	 * @return DAOResultFactory
	 */
	function getByEventType($fileId, $eventType, $userId = null) {
		return parent::_getByEventType(ASSOC_TYPE_SUBMISSION_FILE, $fileId, $eventType, $userId);
	}
}


