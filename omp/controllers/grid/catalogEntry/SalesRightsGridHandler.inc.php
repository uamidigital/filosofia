<?php

/**
 * @file controllers/grid/catalogEntry/SalesRightsGridHandler.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class SalesRightsGridHandler
 * @ingroup controllers_grid_catalogEntry
 *
 * @brief Handle publication format grid requests for sales rights.
 */

// import grid base classes
import('lib.pkp.classes.controllers.grid.GridHandler');


// import format grid specific classes
import('controllers.grid.catalogEntry.SalesRightsGridCellProvider');
import('controllers.grid.catalogEntry.SalesRightsGridRow');

// Link action & modal classes
import('lib.pkp.classes.linkAction.request.AjaxModal');

class SalesRightsGridHandler extends GridHandler {
	/** @var Submission */
	var $_submission;

	/** @var PublicationFormat */
	var $_publicationFormat;

	/**
	 * Constructor
	 */
	function __construct() {
		parent::__construct();
		$this->addRoleAssignment(
				array(ROLE_ID_MANAGER),
				array('fetchGrid', 'fetchRow', 'addRights', 'editRights',
				'updateRights', 'deleteRights'));
	}


	//
	// Getters/Setters
	//
	/**
	 * Get the submission associated with this grid.
	 * @return Submission
	 */
	function getSubmission() {
		return $this->_submission;
	}

	/**
	 * Set the Submission
	 * @param Submission
	 */
	function setSubmission($submission) {
		$this->_submission = $submission;
	}

	/**
	 * Get the publication associated with this grid.
	 * @return Publicaton
	 */
	function getPublication() {
		return $this->_publication;
	}

	/**
	 * Set the Publicaton
	 * @param Publicaton
	 */
	function setPublication($publication) {
		$this->_publication = $publication;
	}

	/**
	 * Get the publication format assocated with these sales rights
	 * @return PublicationFormat
	 */
	function getPublicationFormat() {
		return $this->_publicationFormat;
	}

	/**
	 * Set the publication format
	 * @param PublicationFormat
	 */
	function setPublicationFormat($publicationFormat) {
		$this->_publicationFormat = $publicationFormat;
	}

	//
	// Overridden methods from PKPHandler
	//
	/**
	 * @see PKPHandler::authorize()
	 * @param $request PKPRequest
	 * @param $args array
	 * @param $roleAssignments array
	 */
	function authorize($request, &$args, $roleAssignments) {
		import('lib.pkp.classes.security.authorization.PublicationAccessPolicy');
		$this->addPolicy(new PublicationAccessPolicy($request, $args, $roleAssignments));
		return parent::authorize($request, $args, $roleAssignments);
	}

	/**
	 * @copydoc GridHandler::initialize()
	 */
	function initialize($request, $args = null) {
		parent::initialize($request, $args);

		// Retrieve the authorized submission.
		$this->setSubmission($this->getAuthorizedContextObject(ASSOC_TYPE_SUBMISSION));
		$this->setPublication($this->getAuthorizedContextObject(ASSOC_TYPE_PUBLICATION));
		$publicationFormatDao = DAORegistry::getDAO('PublicationFormatDAO'); /* @var $publicationFormatDao PublicationFormatDAO */
		$representationId = null;

		// Retrieve the associated publication format for this grid.
		$salesRightsId = (int) $request->getUserVar('salesRightsId'); // set if editing or deleting a sales rights entry

		if ($salesRightsId) {
			$salesRightsDao = DAORegistry::getDAO('SalesRightsDAO'); /* @var $salesRightsDao SalesRightsDAO */
			$salesRights = $salesRightsDao->getById($salesRightsId, $this->getPublication()->getId());
			if ($salesRights) {
				$representationId = $salesRights->getPublicationFormatId();
			}
		} else { // empty form for new SalesRights
			$representationId = (int) $request->getUserVar('representationId');
		}

		$submission = $this->getSubmission();
		$publicationFormat = $publicationFormatDao->getById($representationId, $this->getPublication()->getId());

		if ($publicationFormat) {
			$this->setPublicationFormat($publicationFormat);
		} else {
			fatalError('The publication format is not assigned to authorized submission!');
		}

		// Load submission-specific translations
		AppLocale::requireComponents(
			LOCALE_COMPONENT_APP_SUBMISSION,
			LOCALE_COMPONENT_PKP_SUBMISSION,
			LOCALE_COMPONENT_PKP_USER,
			LOCALE_COMPONENT_APP_DEFAULT,
			LOCALE_COMPONENT_PKP_DEFAULT
		);

		// Basic grid configuration
		$this->setTitle('grid.catalogEntry.salesRights');

		// Grid actions
		$router = $request->getRouter();
		$actionArgs = $this->getRequestArgs();
		$this->addAction(
			new LinkAction(
				'addRights',
				new AjaxModal(
					$router->url($request, null, null, 'addRights', null, $actionArgs),
					__('grid.action.addRights'),
					'modal_add_item'
				),
				__('grid.action.addRights'),
				'add_item'
			)
		);

		// Columns
		$cellProvider = new SalesRightsGridCellProvider();
		$this->addColumn(
			new GridColumn(
				'type',
				'grid.catalogEntry.salesRightsType',
				null,
				null,
				$cellProvider
			)
		);
		$this->addColumn(
			new GridColumn(
				'ROW',
				'grid.catalogEntry.salesRightsROW',
				null,
				'controllers/grid/common/cell/checkMarkCell.tpl',
				$cellProvider
			)
		);
	}


	//
	// Overridden methods from GridHandler
	//
	/**
	 * @see GridHandler::getRowInstance()
	 * @return SalesRightsGridRow
	 */
	function getRowInstance() {
		return new SalesRightsGridRow($this->getSubmission());
	}

	/**
	 * Get the arguments that will identify the data in the grid
	 * In this case, the submission.
	 * @return array
	 */
	function getRequestArgs() {
		return [
			'submissionId' => $this->getSubmission()->getId(),
			'publicationId' => $this->getPublication()->getId(),
			'representationId' => $this->getPublicationFormat()->getId()
		];
	}

	/**
	 * @see GridHandler::loadData
	 */
	function loadData($request, $filter = null) {
		$publicationFormat = $this->getPublicationFormat();
		$salesRightsDao = DAORegistry::getDAO('SalesRightsDAO'); /* @var $salesRightsDao SalesRightsDAO */
		$data = $salesRightsDao->getByPublicationFormatId($publicationFormat->getId());
		return $data->toArray();
	}


	//
	// Public Sales Rights Grid Actions
	//
	/**
	 * Edit a new (empty) rights entry
	 * @param $args array
	 * @param $request PKPRequest
	 * @return JSONMessage JSON object
	 */
	function addRights($args, $request) {
		return $this->editRights($args, $request);
	}

	/**
	 * Edit a sales rights entry
	 * @param $args array
	 * @param $request PKPRequest
	 * @return JSONMessage JSON object
	 */
	function editRights($args, $request) {
		// Identify the sales rights entry to be updated
		$salesRightsId = (int) $request->getUserVar('salesRightsId');
		$submission = $this->getSubmission();

		$salesRightsDao = DAORegistry::getDAO('SalesRightsDAO'); /* @var $salesRightsDao SalesRightsDAO */
		$salesRights = $salesRightsDao->getById($salesRightsId, $this->getPublication()->getId());

		// Form handling
		import('controllers.grid.catalogEntry.form.SalesRightsForm');
		$salesRightsForm = new SalesRightsForm($submission, $this->getPublication(), $salesRights);
		$salesRightsForm->initData();

		return new JSONMessage(true, $salesRightsForm->fetch($request));
	}

	/**
	 * Update a sales rights entry
	 * @param $args array
	 * @param $request PKPRequest
	 * @return JSONMessage JSON object
	 */
	function updateRights($args, $request) {
		// Identify the sales rights entry to be updated
		$salesRightsId = $request->getUserVar('salesRightsId');
		$submission = $this->getSubmission();

		$salesRightsDao = DAORegistry::getDAO('SalesRightsDAO'); /* @var $salesRightsDao SalesRightsDAO */
		$salesRights = $salesRightsDao->getById($salesRightsId, $this->getPublication()->getId());

		// Form handling
		import('controllers.grid.catalogEntry.form.SalesRightsForm');
		$salesRightsForm = new SalesRightsForm($submission, $this->getPublication(), $salesRights);
		$salesRightsForm->readInputData();
		if ($salesRightsForm->validate()) {
			$salesRightsId = $salesRightsForm->execute();

			if(!isset($salesRights)) {
				// This is a new entry
				$salesRights = $salesRightsDao->getById($salesRightsId, $this->getPublication()->getId());
				// New added entry action notification content.
				$notificationContent = __('notification.addedSalesRights');
			} else {
				// entry edit action notification content.
				$notificationContent = __('notification.editedSalesRights');
			}

			// Create trivial notification.
			$currentUser = $request->getUser();
			$notificationMgr = new NotificationManager();
			$notificationMgr->createTrivialNotification($currentUser->getId(), NOTIFICATION_TYPE_SUCCESS, array('contents' => $notificationContent));

			// Prepare the grid row data
			$row = $this->getRowInstance();
			$row->setGridId($this->getId());
			$row->setId($salesRightsId);
			$row->setData($salesRights);
			$row->initialize($request);

			// Render the row into a JSON response
			return DAO::getDataChangedEvent();

		} else {
			return new JSONMessage(true, $salesRightsForm->fetch($request));
		}
	}

	/**
	 * Delete a sales rights entry
	 * @param $args array
	 * @param $request PKPRequest
	 * @return JSONMessage JSON object
	 */
	function deleteRights($args, $request) {

		// Identify the sales rights entry to be deleted
		$salesRightsId = $request->getUserVar('salesRightsId');

		$salesRightsDao = DAORegistry::getDAO('SalesRightsDAO'); /* @var $salesRightsDao SalesRightsDAO */
		$salesRights = $salesRightsDao->getById($salesRightsId, $this->getPublication()->getId());
		if ($salesRights != null) { // authorized

			$result = $salesRightsDao->deleteObject($salesRights);

			if ($result) {
				$currentUser = $request->getUser();
				$notificationMgr = new NotificationManager();
				$notificationMgr->createTrivialNotification($currentUser->getId(), NOTIFICATION_TYPE_SUCCESS, array('contents' => __('notification.removedSalesRights')));
				return DAO::getDataChangedEvent();
			} else {
				return new JSONMessage(false, __('manager.setup.errorDeletingItem'));
			}
		}
	}
}


