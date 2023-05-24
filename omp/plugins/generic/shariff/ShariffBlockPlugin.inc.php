<?php

/**
 * @file plugins/generic/shariff/ShariffBlockPlugin.inc.php
 *
 * Copyright (c) 2018 Center for Digital Systems (CeDiS), Freie Universität Berlin
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * @class ShariffBlockPlugin
 * @ingroup plugins_generic_shariff
 *
 * @brief Class for block component of shariff plugin
 */

import('lib.pkp.classes.plugins.BlockPlugin');

class ShariffBlockPlugin extends BlockPlugin {
	/** @var string Name an Path of parent plugin */
	var $parentPluginName;
	var $parentPluginPath;

	/**
	 * Constructor
	 * @param $parentPluginName string Name of parent plugin.
	 * @param $parentPluginPath string Path of parent plugin.
	 */
	function __construct($parentPluginName, $parentPluginPath) {
		parent::__construct();
		$this->parentPluginName = $parentPluginName;
		$this->parentPluginPath = $parentPluginPath;
	}

	/**
	 * @copydoc Plugin::getName()
	 */
	function getName() {
		return 'ShariffBlockPlugin';
	}

	/**
	 * Hide this plugin from the management interface (it's subsidiary)
	 * @return bool
	 */
	function getHideManagement() {
		return true;
	}

	/**
	 * @copydoc Plugin::getDisplayName()
	 */
	function getDisplayName() {
		return __('plugins.generic.shariff.block.displayName');
	}

	/**
	 * @copydoc Plugin::getDescription()
	 */
	function getDescription() {
		return __('plugins.generic.shariff.block.description');
	}

	/**
	 * Get the supported contexts (e.g. BLOCK_CONTEXT_...) for this block.
	 * @return array
	 */
	function getSupportedContexts() {
		return array(BLOCK_CONTEXT_SIDEBAR);
	}

	/**
	 * Get the shariff plugin
	 * @return ShariffPlugin
	 */
	function getShariffPlugin() {
		return PluginRegistry::getPlugin('generic', $this->parentPluginName);
	}

	/**
	 * @copydoc Plugin::getPluginPath()
	 */
	function getPluginPath() {
	    return $this->parentPluginPath;
	}

	/**
	 * @copydoc BlockPlugin::getBlockTemplateFilename()
	 */
	function getBlockTemplateFilename() {
		// Return the shariff block template.		
	    $plugin = $this->getShariffPlugin();
	    return (method_exists($plugin, 'getTemplateResource') ? '' : 'templates'.DIRECTORY_SEPARATOR) . 'shariffBlock.tpl';
	}


	/**
	 * Get the HTML contents for this block.
	 * @param $templateMgr object
	 * @param $request PKPRequest
	 * @return $string
	 */
	function getContents($templateMgr, $request = null) {
		$context = $request->getContext();
		
		if (strcmp($context->getData('shariffPositionSelected'),'sidebar') == 0) {
		
    		// services
    		$selectedServices = $context->getData('shariffServicesSelected');
    		$preparedServices = array_map(function($arrayElement){return $arrayElement;}, $selectedServices);
    		$dataServicesString = implode(",", $preparedServices);
    		
    		// theme
    		$selectedTheme = $context->getData('shariffThemeSelected');
    
    		// orientation
    		$selectedOrientation = $context->getData('shariffOrientationSelected');
    
    		// get language from system
    		$locale = AppLocale::getLocale();
    		$iso1Lang = AppLocale::getIso1FromLocale($locale);
    
    		// javascript, css and backend url
    		$requestedUrl = $request->getCompleteUrl();
    		$baseUrl = $request->getBaseUrl();
    		$jsUrl = $baseUrl .'/'. $this->getShariffPlugin()->getPluginPath().'/shariff-3.2.1/shariff.complete.js';
    		$cssUrl = $baseUrl .'/' . $this->getShariffPlugin()->getPluginPath() . '/shariff-3.2.1/shariff.complete.css';
    		$backendUrl = $baseUrl .'/'. 'shariff-backend';
    
    		// assign variables to the templates
    		$templateMgr->assign('dataServicesString', $dataServicesString);
    		$templateMgr->assign('selectedTheme', $selectedTheme);
    		$templateMgr->assign('selectedOrientation', $selectedOrientation);
    		$templateMgr->assign('backendUrl', $backendUrl);
    		$templateMgr->assign('iso1Lang', $iso1Lang);
    		$templateMgr->assign('requestedUrl', $requestedUrl);
    		$templateMgr->assign('jsUrl', $jsUrl);
    		$templateMgr->assign('cssUrl', $cssUrl);
		}

		return parent::getContents($templateMgr, $request);
	}
}

?>
