<?php return array (
  'plugins.importexport.datacite.description' => 'Deposite submissions in OMP\'s datacite XML format.',
  'plugins.importexport.datacite.deposited' => 'Deposited',
  'plugins.importexport.datacite.depositedSubmissions' => 'Deposited submissions',
  'plugins.importexport.datacite.deposit' => 'Deposit',
  'plugins.importexport.datacite.displayName' => 'Datacite XML Plugin',
  'plugins.importexport.datacite.error' => 'Error',
  'plugins.importexport.datacite.queued' => 'To Deposit',
  'plugins.importexport.datacite.redeposit' => 'Deposit Again',
  'plugins.importexport.datacite.submittedSubmissions' => 'Select monographs to export',
  'plugins.importexport.datacite.results' => 'Results',
  'plugins.importexport.datacite.settings.description' => 'Description',
  'plugins.importexport.datacite.intro' => 'This plugin registers DOIs for monographs and chapters  for DOI provider <a href="https://datacite.org">Datacite.org</a>. Additionally it supports <a href="https://www.da-ra.de/home/">da|ra</a>) registration;  Germany based Datacite DOI registration agency.',
  'plugins.importexport.datacite.settings' => 'Settings',
  'plugins.importexport.datacite.settings.form.dara' => 'Use <a href="https://www.da-ra.de">da|ra</a>  as DOI provider',
  'plugins.importexport.datacite.settings.form.testUrl' => 'Test Url',
  'plugins.importexport.datacite.settings.form.password' => 'Password',
  'plugins.importexport.datacite.settings.form.password.description' => ' ',
  'plugins.importexport.datacite.settings.form.url' => 'Datacite URL',
  'plugins.importexport.datacite.settings.form.username' => 'Username (symbol)',
  'plugins.importexport.datacite.settings.form.usernameRequired' => 'Please enter the username (symbol) you got from DataCite. The username may not contain colons.',
  'plugins.importexport.datacite.settings.form.automaticRegistration.description' => 'OMP will deposit DOIs automatically to DataCite. Please note that this may take a short amount of time after publication to process (e.g. depending on your cronjob configuration). You can check for all unregistered DOIs.',
  'plugins.importexport.datacite.settings.form.testMode.description' => 'Use the DataCite test prefix for DOI registration. Please do not forget to remove this option for the production.',
  'plugins.importexport.datacite.settings.form.testDescription' => 'Test Server settings ',
  'plugins.importexport.datacite.settings.form.testIntro' => 'You can set the datacited test server here e.g. https://labs.da-ra.de/dara/study/importXML?registration=true ',
  'plugins.importexport.datacite.settings.form.testPrefix' => 'Test Prefix',
  'plugins.importexport.datacite.settings.form.testRegistry' => ' Test registry',
  'plugins.importexport.datacite.senderTask.name' => 'DataCite automatic registration task',
  'plugins.importexport.datacite.cliUsage' => 'Usage: {$scriptName} {$pluginName} export [outputFileName] [journal_path] {issues|articles|galleys} objectId1 [objectId2] ... {$scriptName} {$pluginName} register [journal_path] {issues|articles|galleys} objectId1 [objectId2] ...',
  'plugins.importexport.datacite.tab.monographs' => 'Monographs / Chapters',
  'plugins.importexport.datacite.status.registered' => 'Deposited',
  'plugins.importexport.datacite.status.markedregistered' => 'Marked registered',
  'plugins.importexport.datacite.status.todeposit' => 'Not Deposited',
  'plugins.importexport.datacite.status.any' => 'Any Status',
  'plugins.importexport.datacite.table.status' => 'Status',
  'plugins.importexport.datacite.table.doi' => 'DOI',
  'plugins.importexport.datacite.table.published' => 'Published ',
  'plugins.importexport.datacite.table.authortitle' => 'Author; Title ',
  'plugins.importexport.datacite.table.id' => 'ID',
  'plugins.importexport.datacite.table.select' => 'Select',
  'plugins.importexport.datacite.table.items' => 'items',
  'plugins.importexport.datacite.table.of' => 'of',
  'plugins.importexport.datacite.button.register' => 'Register',
  'plugins.importexport.datacite.button.markRegistered' => 'Mark registered',
  'plugins.importexport.datacite.error.mdsError' => 'Registration was not successful! The DOI registration server returned an error: \'{$param}\'.',
  'plugins.importexport.datacite.search' => 'Search',
  'plugins.importexport.datacite.search.authors' => 'Authors',
  'plugins.importexport.datacite.search.title' => 'Title',
);