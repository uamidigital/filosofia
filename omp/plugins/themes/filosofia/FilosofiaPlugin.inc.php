<?php

/**
 * @file plugins/themes/filosofia/FilosofiaPlugin.inc.php
 */

 import('lib.pkp.classes.plugins.ThemePlugin');
 
 class FilosofiaPlugin extends ThemePlugin {
	/**
	 * @copydoc ThemePlugin::isActive()
	 */
	public function isActive() {
		if (defined('SESSION_DISABLE_INIT')) return true;
		return parent::isActive();
	}

	/**
	 * Initialize the theme's styles, scripts and hooks. This is run on the
	 * currently active theme and it's parent themes.
	 *
	 * @return null
	 */
	public function init() {

		// Register theme options
		$this->addOption('typography', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.filosofia.option.typography.label'),
			'description' => __('plugins.themes.filosofia.option.typography.description'),
			'options' => [
				[
					'value' => 'notoSans',
					'label' => __('plugins.themes.filosofia.option.typography.notoSans'),
				],
				[
					'value' => 'notoSerif',
					'label' => __('plugins.themes.filosofia.option.typography.notoSerif'),
				],
				[
					'value' => 'notoSerif_notoSans',
					'label' => __('plugins.themes.filosofia.option.typography.notoSerif_notoSans'),
				],
				[
					'value' => 'notoSans_notoSerif',
					'label' => __('plugins.themes.filosofia.option.typography.notoSans_notoSerif'),
				],
				[
					'value' => 'lato',
					'label' => __('plugins.themes.filosofia.option.typography.lato'),
				],
				[
					'value' => 'lora',
					'label' => __('plugins.themes.filosofia.option.typography.lora'),
				],
				[
					'value' => 'lora_openSans',
					'label' => __('plugins.themes.filosofia.option.typography.lora_openSans'),
				],
				[
					'value' => 'Verdana',
					'label' => __('plugins.themes.filosofia.option.typography.Verdana'),
				]
			],
			'default' => 'Verdana',
		]);
		$this->addOption('useHomepageImageAsHeader', 'FieldOptions', [
			'label' => __('plugins.themes.filosofia.option.useHomepageImageAsHeader.label'),
			'description' => __('plugins.themes.filosofia.option.useHomepageImageAsHeader.description'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.filosofia.option.useHomepageImageAsHeader.option')
				],
			],
			'default' => false,
		]);

		$this->addOption('baseColour', 'FieldColor', [
			'label' => __('plugins.themes.filosofia.option.colour.label'),
			'description' => __('plugins.themes.filosofia.option.colour.description'),
			'default' => '#1E6292',
		]);

		// Load primary stylesheet
		$this->addStyle('stylesheet', 'styles/index.less');

		// Store additional LESS variables to process based on options
		$additionalLessVariables = array();

		if ($this->getOption('typography') === 'notoSerif') {
			$this->addStyle('font', 'styles/fonts/notoSerif.less');
			$additionalLessVariables[] = '@font: "Noto Serif", -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen-Sans", "Ubuntu", "Cantarell", "Helvetica Neue", sans-serif;';
		} elseif (strpos($this->getOption('typography'), 'notoSerif') !== false) {
			$this->addStyle('font', 'styles/fonts/notoSans_notoSerif.less');
			if ($this->getOption('typography') == 'notoSerif_notoSans') {
				$additionalLessVariables[] = '@font-heading: "Noto Serif", serif;';
			} elseif ($this->getOption('typography') == 'notoSans_notoSerif') {
				$additionalLessVariables[] = '@font: "Noto Serif", serif;@font-heading: "Noto Sans", serif;';
			}
		} elseif ($this->getOption('typography') == 'lato') {
			$this->addStyle('font', 'styles/fonts/lato.less');
			$additionalLessVariables[] = '@font: Lato, sans-serif;';
		} elseif ($this->getOption('typography') == 'lora') {
			$this->addStyle('font', 'styles/fonts/lora.less');
			$additionalLessVariables[] = '@font: Lora, serif;';
		} elseif ($this->getOption('typography') == 'lora_openSans') {
			$this->addStyle('font', 'styles/fonts/lora_openSans.less');
			$additionalLessVariables[] = '@font: "Open Sans", sans-serif;@font-heading: Lora, serif;';
		} elseif($this->getOption('typography' == 'Verdana')) {
			$this->addStyle('font', 'styles/fonts/verdana.less');
			$additionalLessVariables[] = '@font: "Verdana", -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen-Sans", "Ubuntu", "Cantarell", "Helvetica Neue", sans-serif;';
		} else {
			$this->addStyle('font', 'styles/fonts/notoSans.less');
		}

		// Update colour based on theme option
		if ($this->getOption('baseColour') !== '#1E6292') {
			$additionalLessVariables[] = '@bg-base:' . $this->getOption('baseColour') . ';';
			if (!$this->isColourDark($this->getOption('baseColour'))) {
				$additionalLessVariables[] = '@text-bg-base:rgba(0,0,0,0.84);';
				$additionalLessVariables[] = '@bg-base-border-color:rgba(0,0,0,0.2);';
			}
		}

		$this->addStyle('leaflet', 'styles/leaflet.css');
		$this->addStyle('fontawesome', 'styles/fa.css');

		// Pass additional LESS variables based on options
		if (!empty($additionalLessVariables)) {
			$this->modifyStyle('stylesheet', array('addLessVariables' => join("\n", $additionalLessVariables)));
		}

		$request = Application::get()->getRequest();

		// Load icon font FontAwesome - http://fontawesome.io/
		$this->addStyle(
			'fontAwesome',
			$request->getBaseUrl() . '/lib/pkp/styles/fontawesome/fontawesome.css',
			array('baseUrl' => '')
		);

		// Get homepage image and use as header background if useAsHeader is true
		$context = Application::get()->getRequest()->getContext();
		if ($context && $this->getOption('useHomepageImageAsHeader')) {

			$publicFileManager = new PublicFileManager();
			$publicFilesDir = $request->getBaseUrl() . '/' . $publicFileManager->getContextFilesPath($context->getId());

			$homepageImage = $context->getLocalizedData('homepageImage');

			$homepageImageUrl = $publicFilesDir . '/' . $homepageImage['uploadName'];

			$this->addStyle(
				'homepageImage',
				'.pkp_structure_head { background: center / cover no-repeat url("' . $homepageImageUrl . '");}',
				['inline' => true]
			);
		}

		// Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
		$min = Config::getVar('general', 'enable_minified') ? '.min' : '';
		$jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
		$jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
		// Use an empty `baseUrl` argument to prevent the theme from looking for
		// the files within the theme directory
		$this->addScript('jQuery', $jquery, array('baseUrl' => ''));
		$this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));

		// Load Bootsrap's dropdown
		$this->addScript('popper', 'js/lib/popper/popper.js');
		$this->addScript('bsUtil', 'js/lib/bootstrap/util.js');
		$this->addScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');

		// Load custom JavaScript for this theme
		$this->addScript('default', 'js/main.js');

		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));
		$this->addScript('bootstrap', 'scripts/bootstrap.min.js');
		//Load leaflet
		$this->addScript('leaflet', 'scripts/leaflet.min.js');
		//Load personal script
		$this->addScript('scripts','scripts/scripts.js');
	}

	/**
	 * Get the name of the settings file to be installed on new journal
	 * creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Get the name of the settings file to be installed site-wide when
	 * OJS is installed.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.filosofia.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.filosofia.description');
	}
 }

 ?>