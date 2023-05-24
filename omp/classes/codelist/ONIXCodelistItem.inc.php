<?php

/**
 * @file classes/codelist/ONIXCodelistItem.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class ONIXCodelistItem
 * @ingroup codelist
 * @see ONIXCodelistItemDAO
 *
 * @brief Basic class describing a codelist item.
 *
 */

class ONIXCodelistItem extends DataObject {
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
	 * Get the text component of the codelist.
	 * @return string
	 */
	function getText() {
		return $this->getData('text');
	}

	/**
	 * Set the text component of the codelist.
	 * @param $text string
	 */
	function setText($text) {
		return $this->setData('text', $text);
	}

	/**
	 * Get codelist code.
	 * @return string
	 */
	function getCode() {
		return $this->getData('code');
	}

	/**
	 * Set codelist code.
	 * @param $code string
	 */
	function setCode($code) {
		return $this->setData('code', $code);
	}
}

