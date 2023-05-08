<?php
/**
 * @file classes/components/form/context/MetadataSettingsForm.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class MetadataSettingsForm
 * @ingroup classes_controllers_form
 *
 * @brief Add OJS-specific fields to the masthead form.
 */
namespace APP\components\forms\context;
use \PKP\components\forms\context\PKPMetadataSettingsForm;
use \PKP\components\forms\FieldOptions;

class MetadataSettingsForm extends PKPMetadataSettingsForm {

	/**
	 * @copydoc PKPMetadataSettingsForm::__construct()
	 */
	public function __construct($action, $context) {
		parent::__construct($action, $context);

		$this->addField(new FieldOptions('enablePublisherId', [
			'label' => __('submission.publisherId'),
			'description' => __('submission.publisherId.description'),
			'options' => [
				[
					'value' => 'publication',
					'label' => __('submission.publisherId.enable', ['objects' => __('common.publications')]),
				],
				[
					'value' => 'chapter',
					'label' => __('submission.publisherId.enable', ['objects' => __('submission.chapters')]),
				],
				[
					'value' => 'representation',
					'label' => __('submission.publisherId.enable', ['objects' => __('monograph.publicationFormats')]),
				],
				[
					'value' => 'file',
					'label' => __('submission.publisherId.enable', ['objects' => __('submission.files')]),
				],
			],
			'value' => $context->getData('enablePublisherId') ? $context->getData('enablePublisherId') : [],
		]));
	}
}
