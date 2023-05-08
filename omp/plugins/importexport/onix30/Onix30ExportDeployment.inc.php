<?php

/**
 * @file plugins/importexport/onix30/Onix30ExportDeployment.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class Onix30ExportDeployment
 * @ingroup plugins_importexport_onix30
 *
 * @brief Class configuring the native import/export process to this
 * application's specifics.
 */

import('lib.pkp.classes.plugins.importexport.PKPImportExportDeployment');

class Onix30ExportDeployment extends PKPImportExportDeployment {
	/**
	 * Constructor
	 * @param $context Context
	 * @param $user User
	 */
	function __construct($context, $user) {
		parent::__construct($context, $user);
	}

	//
	// Deploymenturation items for subclasses to override
	//
	/**
	 * Get the submission node name
	 * @return string
	 */
	function getSubmissionNodeName() {
		return 'ONIXMessage';
	}

	/**
	 * Get the schema filename.
	 * @return string
	 */
	function getSchemaFilename() {
		return 'ONIX_BookProduct_3.0_reference.xsd';
	}

	/**
	 * Get the namespace URN
	 * @return string
	 */
	function getNamespace() {
		return 'http://ns.editeur.org/onix/3.0/reference';
	}

	/**
	 * Get possible Warnings and Errors from the import/export process
	 *
	 * @return array
	 */
	public function getWarningsAndErrors() {
		$problems = [];
		$objectTypes = $this->getObjectTypes();
		foreach ($objectTypes as $assocType => $name) {
			$foundWarnings = $this->getProcessedObjectsWarnings($assocType);
			if (!empty($foundWarnings)) {
				$problems['warnings'][$name][] = $foundWarnings;
			}

			$foundErrors = $this->getProcessedObjectsErrors($assocType);
			if (!empty($foundErrors)) {
				$problems['errors'][$name][] = $foundErrors;
			}
		}

		return $problems;
	}

	protected function getObjectTypes() {
		$objectTypes = [
			ASSOC_TYPE_ANY => __('plugins.importexport.onix30.export.type.any'),
			ASSOC_TYPE_SUBMISSION => __('plugins.importexport.onix30.export.type.submission'),
		];

		return $objectTypes;
	}

	/**
	 * Returns an indication that the import/export process has failed
	 *
	 * @return bool
	 */
	public function isProcessFailed() {
		if (count($this->_processedObjectsErrors) > 0 || count($this->xmlValidationErrors) > 0) {
			return true;
		}

		return false;
	}

	/**
	 * Getter method for XMLValidation Errors
	 *
	 * @return array
	 */
	public function getXMLValidationErrors() {
		return $this->xmlValidationErrors;
	}
}


