<?php

/**
 * @file plugins/pubIds/doi/DOIPubIdPlugin.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class DOIPubIdPlugin
 * @ingroup plugins_pubIds_doi
 *
 * @brief DOI plugin class
 */


import('classes.plugins.PubIdPlugin');

class DOIPubIdPlugin extends PubIdPlugin {

	/**
	 * @copydoc Plugin::register()
	 */
	public function register($category, $path, $mainContextId = null) {
		$success = parent::register($category, $path, $mainContextId);
		if (!Config::getVar('general', 'installed') || defined('RUNNING_UPGRADE')) return $success;
		if ($success && $this->getEnabled($mainContextId)) {
			HookRegistry::register('Publication::getProperties::summaryProperties', array($this, 'modifyObjectProperties'));
			HookRegistry::register('Publication::getProperties::fullProperties', array($this, 'modifyObjectProperties'));
			HookRegistry::register('Publication::validate', array($this, 'validatePublicationDoi'));
			HookRegistry::register('Publication::getProperties::values', array($this, 'modifyObjectPropertyValues'));
			HookRegistry::register('Form::config::before', array($this, 'addPublicationFormFields'));
			HookRegistry::register('Form::config::before', array($this, 'addPublishFormNotice'));
		}
		return $success;
	}

	//
	// Implement template methods from Plugin.
	//
	/**
	 * @copydoc Plugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.pubIds.doi.displayName');
	}

	/**
	 * @copydoc Plugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.pubIds.doi.description');
	}


	//
	// Implement template methods from PubIdPlugin.
	//
	/**
	 * @copydoc PKPPubIdPlugin::constructPubId()
	 */
	function constructPubId($pubIdPrefix, $pubIdSuffix, $contextId) {
		return $pubIdPrefix . '/' . $pubIdSuffix;
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPubIdType()
	 */
	function getPubIdType() {
		return 'doi';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPubIdDisplayType()
	 */
	function getPubIdDisplayType() {
		return 'DOI';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPubIdFullName()
	 */
	function getPubIdFullName() {
		return 'Digital Object Identifier';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getResolvingURL()
	 */
	function getResolvingURL($contextId, $pubId) {
		return 'https://doi.org/'.$this->_doiURLEncode($pubId);
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPubIdMetadataFile()
	 */
	function getPubIdMetadataFile() {
		return $this->getTemplateResource('doiSuffixEdit.tpl');
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPubIdAssignFile()
	 */
	function getPubIdAssignFile() {
		return $this->getTemplateResource('doiAssign.tpl');
	}

	/**
	 * @copydoc PKPPubIdPlugin::instantiateSettingsForm()
	 */
	function instantiateSettingsForm($contextId) {
		$this->import('classes.form.DOISettingsForm');
		return new DOISettingsForm($this, $contextId);
	}

	/**
	 * @copydoc PKPPubIdPlugin::getFormFieldNames()
	 */
	function getFormFieldNames() {
		return array('doiSuffix');
	}

	/**
	 * @copydoc PKPPubIdPlugin::getAssignFormFieldName()
	 */
	function getAssignFormFieldName() {
		return 'assignDoi';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getPrefixFieldName()
	 */
	function getPrefixFieldName() {
		return 'doiPrefix';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getSuffixFieldName()
	 */
	function getSuffixFieldName() {
		return 'doiSuffix';
	}

	/**
	 * @copydoc PKPPubIdPlugin::getLinkActions()
	 */
	function getLinkActions($pubObject) {
		$linkActions = array();
		import('lib.pkp.classes.linkAction.request.RemoteActionConfirmationModal');
		$request = Application::get()->getRequest();
		$userVars = $request->getUserVars();
		$userVars['pubIdPlugIn'] = get_class($this);
		// Clear object pub id
		$linkActions['clearPubIdLinkActionDoi'] = new LinkAction(
			'clearPubId',
			new RemoteActionConfirmationModal(
				$request->getSession(),
				__('plugins.pubIds.doi.editor.clearObjectsDoi.confirm'),
				__('common.delete'),
				$request->url(null, null, 'clearPubId', null, $userVars),
				'modal_delete'
			),
			__('plugins.pubIds.doi.editor.clearObjectsDoi'),
			'delete',
			__('plugins.pubIds.doi.editor.clearObjectsDoi')
		);
		return $linkActions;
	}

	/**
	 * @copydoc PKPPubIdPlugin::getSuffixPatternsFieldNames()
	 */
	function getSuffixPatternsFieldNames() {
		return  array(
			'Submission' => 'doiPublicationSuffixPattern',
			'Representation' => 'doiRepresentationSuffixPattern',
			'SubmissionFile' => 'doiSubmissionFileSuffixPattern',
			'Chapter' => 'doiChapterSuffixPattern',
		);
	}

	/**
	 * @copydoc PKPPubIdPlugin::getDAOFieldNames()
	 */
	function getDAOFieldNames() {
		return array('pub-id::doi');
	}

	/**
	 * @copydoc PKPPubIdPlugin::isObjectTypeEnabled()
	 */
	function isObjectTypeEnabled($pubObjectType, $contextId) {
		return (boolean) $this->getSetting($contextId, "enable${pubObjectType}Doi");
	}

	/**
	 * @copydoc PKPPubIdPlugin::isObjectTypeEnabled()
	 */
	function getNotUniqueErrorMsg() {
		return __('plugins.pubIds.doi.editor.doiSuffixCustomIdentifierNotUnique');
	}

	/**
	 * @copydoc PKPPubIdPlugin::validatePubId()
	 */
	function validatePubId($pubId) {
		return preg_match('/^\d+(.\d+)+\//', $pubId);
	}


	/*
	 * Private methods
	 */
	/**
	 * Encode DOI according to ANSI/NISO Z39.84-2005, Appendix E.
	 * @param $pubId string
	 * @return string
	 */
	function _doiURLEncode($pubId) {
		$search = array ('%', '"', '#', ' ', '<', '>', '{');
		$replace = array ('%25', '%22', '%23', '%20', '%3c', '%3e', '%7b');
		$pubId = str_replace($search, $replace, $pubId);
		return $pubId;
	}

	/**
	 * Validate a publication's DOI against the plugin's settings
	 *
	 * @param $hookName string
	 * @param $args array
	 */
	public function validatePublicationDoi($hookName, $args) {
		$errors =& $args[0];
		$action = $args[1];
		$props =& $args[2];

		if (empty($props['pub-id::doi'])) {
			return;
		}

		if ($action === VALIDATE_ACTION_ADD) {
			$submission = Services::get('submission')->get($props['submissionId']);
		} else {
			$publication = Services::get('publication')->get($props['id']);
			$submission = Services::get('submission')->get($publication->getData('submissionId'));
		}

		$contextId = $submission->getData('contextId');
		$doiPrefix = $this->getSetting($contextId, 'doiPrefix');

		$doiErrors = [];
		if (strpos($props['pub-id::doi'], $doiPrefix) !== 0) {
			$doiErrors[] = __('plugins.pubIds.doi.editor.missingPrefix', ['doiPrefix' => $doiPrefix]);
		}
		if (!$this->checkDuplicate($props['pub-id::doi'], 'Publication', $submission->getId(), $contextId)) {
			$doiErrors[] = $this->getNotUniqueErrorMsg();
		}
		if (!empty($doiErrors)) {
			$errors['pub-id::doi'] = $doiErrors;
		}
	}

	/**
	 * Add DOI to submission, issue or galley properties
	 *
	 * @param $hookName string <Object>::getProperties::summaryProperties or
	 *  <Object>::getProperties::fullProperties
	 * @param $args array [
	 * 		@option $props array Existing properties
	 * 		@option $object Submission|Issue|Galley
	 * 		@option $args array Request args
	 * ]
	 *
	 * @return array
	 */
	public function modifyObjectProperties($hookName, $args) {
		$props =& $args[0];

		$props[] = 'pub-id::doi';
	}

	/**
	 * Add DOI submission, issue or galley values
	 *
	 * @param $hookName string <Object>::getProperties::values
	 * @param $args array [
	 * 		@option $values array Key/value store of property values
	 * 		@option $object Submission|Issue|Galley
	 * 		@option $props array Requested properties
	 * 		@option $args array Request args
	 * ]
	 *
	 * @return array
	 */
	public function modifyObjectPropertyValues($hookName, $args) {
		$values =& $args[0];
		$object = $args[1];
		$props = $args[2];

		if (in_array('pub-id::doi', $props)) {
			$pubId = $this->getPubId($object);
			$values['pub-id::doi'] = $pubId ? $pubId : null;
		}
	}

	/**
	 * Add DOI fields to the publication identifiers form
	 *
	 * @param $hookName string Form::config::before
	 * @param $form FormComponent The form object
	 */
	public function addPublicationFormFields($hookName, $form) {

		if ($form->id !== 'publicationIdentifiers') {
			return;
		}

		if (!$this->getSetting($form->submissionContext->getId(), 'enablePublicationDoi')) {
			return;
		}

		$prefix = $this->getSetting($form->submissionContext->getId(), 'doiPrefix');

		$suffixType = $this->getSetting($form->submissionContext->getId(), 'doiSuffix');
		$pattern = '';
		if ($suffixType === 'default') {
			$pattern = '%p.%m';
		} elseif ($suffixType === 'pattern') {
			$pattern = $this->getSetting($form->submissionContext->getId(), 'doiPublicationSuffixPattern');
		}

		// Add a text field to enter the DOI if no pattern exists
		if (!$pattern) {
			$form->addField(new \PKP\components\forms\FieldText('pub-id::doi', [
				'label' => __('metadata.property.displayName.doi'),
				'description' => __('plugins.pubIds.doi.editor.doi.description', ['prefix' => $prefix]),
				'value' => $form->publication->getData('pub-id::doi'),
			]));
		} else {
			$fieldData = [
				'label' => __('metadata.property.displayName.doi'),
				'value' => $form->publication->getData('pub-id::doi'),
				'prefix' => $prefix,
				'pattern' => $pattern,
				'contextInitials' => PKPString::regexp_replace('/[^-._;()\/A-Za-z0-9]/', '', PKPString::strtolower($form->submissionContext->getData('acronym', $form->submissionContext->getData('primaryLocale')))) ?? '',
				'isPForPress' => true,
				'separator' => '/',
				'submissionId' => $form->publication->getData('submissionId'),
				'assignIdLabel' => __('plugins.pubIds.doi.editor.doi.assignDoi'),
				'clearIdLabel' => __('plugins.pubIds.doi.editor.clearObjectsDoi'),
				'missingPartsLabel' => __('plugins.pubIds.doi.editor.missingParts'),
			];
			if ($form->publication->getData('pub-id::publisher-id')) {
				$fieldData['publisherId'] = $form->publication->getData('pub-id::publisher-id');
			}
			if ($form->publication->getData('pages')) {
				$fieldData['pages'] = $form->publication->getData('pages');
			}
			if ($form->publication->getData('issueId')) {
				$issue = Services::get('issue')->get($form->publication->getData('issueId'));
				if ($issue) {
					$fieldData['issueNumber'] = $issue->getNumber() ?? '';
					$fieldData['issueVolume'] = $issue->getVolume() ?? '';
					$fieldData['year'] = $issue->getYear() ?? '';
				}
			}
			$form->addField(new \PKP\components\forms\FieldPubId('pub-id::doi', $fieldData));
		}
	}

	/**
	 * Show DOI during final publish step
	 *
	 * @param $hookName string Form::config::before
	 * @param $form FormComponent The form object
	 */
	public function addPublishFormNotice($hookName, $form) {

		if ($form->id !== 'publish' || !empty($form->errors)) {
			return;
		}

		$submission = Services::get('submission')->get($form->publication->getData('submissionId'));
		$publicationDoiEnabled = $this->getSetting($submission->getData('contextId'), 'enablePublicationDoi');
		$chapterDoiEnabled = $this->getSetting($submission->getData('contextId'), 'enableChapterDoi');
		$pubFormatDoiEnabled = $this->getSetting($submission->getData('contextId'), 'enableRepresentationDoi');
		$submissionFileDoiEnabled = $this->getSetting($submission->getData('contextId'), 'enableSubmissionFileDoi');
		$warningIconHtml = '<span class="fa fa-exclamation-triangle pkpIcon--inline"></span>';

		if (!$publicationDoiEnabled && !$chapterDoiEnabled && !$pubFormatDoiEnabled && !$submissionFileDoiEnabled) {
			return;

		// Use a simplified view when only assigning to the publication
		} else if (!$chapterDoiEnabled && !$pubFormatDoiEnabled && !$submissionFileDoiEnabled) {
			if ($form->publication->getData('pub-id::doi')) {
				$msg = __('plugins.pubIds.doi.editor.preview.publication', ['doi' => $form->publication->getData('pub-id::doi')]);
			} else {
				$msg = '<div class="pkpNotification pkpNotification--warning">' . $warningIconHtml . __('plugins.pubIds.doi.editor.preview.publication.none') . '</div>';
			}
			$form->addField(new \PKP\components\forms\FieldHTML('doi', [
				'description' => $msg,
				'groupId' => 'default',
			]));
			return;

		// Show a table if more than one DOI is going to be created
		} else {
			$doiTableRows = [];
			if ($publicationDoiEnabled) {
				if ($form->publication->getData('pub-id::doi')) {
					$doiTableRows[] = [$form->publication->getData('pub-id::doi'), 'Publication'];
				} else {
					$doiTableRows[] = [$warningIconHtml . __('submission.status.unassigned'), 'Publication'];
				}
			}
			if ($chapterDoiEnabled) {
				foreach ((array) $form->publication->getData('chapters') as $chapter) {
					if ($chapter->getStoredPubId('doi')) {
						$doiTableRows[] = [$chapter->getStoredPubId('doi'), __('plugins.pubIds.doi.editor.preview.chapters', ['title' => $chapter->getLocalizedFullTitle()])];
					} else {
						$doiTableRows[] = [$warningIconHtml . __('submission.status.unassigned'),__('plugins.pubIds.doi.editor.preview.chapters', ['title' => $chapter->getLocalizedFullTitle()])];
					}
				}
			}
			if ($pubFormatDoiEnabled) {
				foreach ((array) $form->publication->getData('publicationFormats') as $publicationFormat) {
					if ($publicationFormat->getStoredPubId('doi')) {
						$doiTableRows[] = [$publicationFormat->getStoredPubId('doi'), __('plugins.pubIds.doi.editor.preview.publicationFormats', ['title' => $publicationFormat->getLocalizedName()])];
					} else {
						$doiTableRows[] = [$warningIconHtml . __('submission.status.unassigned'),__('plugins.pubIds.doi.editor.preview.publicationFormats', ['title' => $publicationFormat->getLocalizedName()])];
					}
				}
			}
			if ($submissionFileDoiEnabled) {
				foreach ((array) $form->publication->getData('publicationFormats') as $publicationFormat) {
					$filesIterator = Services::get('submissionFile')->getMany([
						'submissionIds' => [$submission->getId()],
						'assocTypes' => [ASSOC_TYPE_REPRESENTATION],
						'assocIds' => [$publicationFormat->getId()],
					]);
					foreach ($filesIterator as $file) {
						if ($file->getStoredPubId('doi')) {
							$doiTableRows[] = [$file->getStoredPubId('doi'), __('plugins.pubIds.doi.editor.preview.files', ['title' => $file->getLocalizedData('name')])];
						} else {
							$doiTableRows[] = [$warningIconHtml . __('submission.status.unassigned'),__('plugins.pubIds.doi.editor.preview.files', ['title' => $file->getLocalizedData('name')])];
						}
					}
				}
			}
			if (!empty($doiTableRows)) {
				$table = '<table class="pkpTable"><thead><tr>' .
					'<th>' . __('plugins.pubIds.doi.editor.doi') . '</th>' .
					'<th>' . __('plugins.pubIds.doi.editor.preview.objects') . '</th>' .
					'</tr></thead><tbody>';
				foreach ($doiTableRows as $doiTableRow) {
					$table .= '<tr><td>' . $doiTableRow[0] . '</td><td>' . $doiTableRow[1] . '</td></tr>';
				}
				$table .= '</tbody></table>';
			}
			$form->addField(new \PKP\components\forms\FieldHTML('doi', [
				'description' => $table,
				'groupId' => 'default',
			]));
		}
	}
}


