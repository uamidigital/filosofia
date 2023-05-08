<?php
/**
 * @file controllers/grid/files/proof/form/ApprovedProofForm.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class ApprovedProofForm
 * @ingroup controllers_grid_files_proof_form
 *
 * @brief Form for editing approved proofs (available for direct sales).
 */


import('lib.pkp.classes.form.Form');

class ApprovedProofForm extends Form {
	/** @var $approvedProof SubmissionFile */
	var $approvedProof;

	/** @var $monograph Monograph */
	var $monograph;

	/** @var $publicationFormat PublicationFormat */
	var $publicationFormat;

	/**
	 * Constructor
	 * @param $monograph Monograph
	 * @param $publicationFormat PublicationFormat
	 * @param $submissionFileId int
	 */
	public function __construct($monograph, $publicationFormat, $submissionFileId) {
		parent::__construct('controllers/grid/files/proof/form/approvedProofForm.tpl');

		$this->monograph = $monograph;
		$this->publicationFormat = $publicationFormat;
		$this->approvedProof = Services::get('submissionFile')->get($submissionFileId);

		// matches currencies like:  1,500.50 1500.50 1,112.15 5,99 .99
		$this->addCheck(new FormValidatorRegExp($this, 'price', 'optional', 'grid.catalogEntry.validPriceRequired', '/^(([1-9]\d{0,2}(,\d{3})*|[1-9]\d*|0|)(.\d{2})?|([1-9]\d{0,2}(,\d{3})*|[1-9]\d*|0|)(.\d{2})?)$/'));
		$this->addCheck(new FormValidatorPost($this));
		$this->addCheck(new FormValidatorCSRF($this));
	}


	//
	// Extended methods from Form
	//
	/**
	 * @copydoc Form::fetch
	 */
	public function fetch($request, $template = null, $display = false) {
		$templateMgr = TemplateManager::getManager($request);
		$templateMgr->assign('submissionFileId', $this->approvedProof->getId());
		$templateMgr->assign('submissionId', $this->monograph->getId());
		$templateMgr->assign('representationId', $this->publicationFormat->getId());
		$templateMgr->assign('publicationId', $this->publicationFormat->getData('publicationId'));

		$salesTypes = array(
			'openAccess' => 'payment.directSales.openAccess',
			'directSales' => 'payment.directSales.directSales',
			'notAvailable' => 'payment.directSales.notAvailable',
		);

		$templateMgr->assign('salesTypes', $salesTypes);
		$templateMgr->assign('salesType', $this->approvedProof->getSalesType());
		return parent::fetch($request, $template, $display);
	}

	/**
	 * @see Form::readInputData()
	 */
	public function readInputData() {
		$this->readUserVars(array('price', 'salesType'));
	}

	/**
	 * @see Form::initData()
	 */
	public function initData() {
		$this->_data = array(
			'price' => $this->approvedProof->getDirectSalesPrice(),
			'salesType' => $this->approvedProof->getSalesType(),
		);
	}

	/**
	 * @copydoc Form::execute()
	 */
	public function execute(...$functionArgs) {
		parent::execute(...$functionArgs);
		$submissionFileDao = DAORegistry::getDAO('SubmissionFileDAO'); /* @var $submissionFileDao SubmissionFileDAO */
		$salesType = $this->getData('salesType');
		if ($salesType === 'notAvailable') {
			// Not available
			$this->approvedProof->setDirectSalesPrice(null);
		} elseif ($salesType === 'openAccess') {
			// Open access
			$this->approvedProof->setDirectSalesPrice(0);
		} else { /* $salesType === 'directSales' */
			// Direct sale
			$this->approvedProof->setDirectSalesPrice($this->getData('price'));
		}
		$this->approvedProof->setSalesType($salesType);
		$submissionFileDao->updateObject($this->approvedProof);

		return $this->approvedProof->getId();
	}
}


