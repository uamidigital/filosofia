<?php
/**
 * @file classes/services/QueryBuilders/ContextQueryBuilder.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class ContextQueryBuilder
 * @ingroup query_builders
 *
 * @brief Journal list query builder
 */
namespace APP\Services\QueryBuilders;

use Illuminate\Database\Capsule\Manager as Capsule;

class ContextQueryBuilder extends \PKP\Services\QueryBuilders\PKPContextQueryBuilder {
	/** @copydoc \PKP\Services\QueryBuilders\PKPContextQueryBuilder::$db */
	protected $db = 'presses';

	/** @copydoc \PKP\Services\QueryBuilders\PKPContextQueryBuilder::$dbSettings */
	protected $dbSettings = 'press_settings';

	/** @copydoc \PKP\Services\QueryBuilders\PKPContextQueryBuilder::$dbIdColumn */
	protected $dbIdColumn = 'press_id';
}
