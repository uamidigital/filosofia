<?php

/**
 * @file classes/user/UserAction.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class UserAction
 * @ingroup user
 * @see User
 *
 * @brief UserAction class.
 */

import('lib.pkp.classes.user.PKPUserAction');

class UserAction extends PKPUserAction {
	/**
	 * @copydoc PKPUserAction::mergeUsers()
	 */
	public function mergeUsers($oldUserId, $newUserId) {
		if (!parent::mergeUsers($oldUserId, $newUserId)) return false;

		// Transfer completed payments.
		$paymentDao = DAORegistry::getDAO('OMPCompletedPaymentDAO'); /* @var $paymentDao OMPCompletedPaymentDAO */
		$paymentFactory = $paymentDao->getByUserId($oldUserId);
		while ($payment = $paymentFactory->next()) {
			$payment->setUserId($newUserId);
			$paymentDao->updateObject($payment);
		}

		return true;
	}
}

