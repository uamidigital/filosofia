<?php
/**
 * @file classes/services/StatsService.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class PKPStatsService
 * @ingroup services
 *
 * @brief Helper class that encapsulates statistics business logic
 */
namespace APP\Services;

class StatsService extends \PKP\Services\PKPStatsService {
	/**
	 * Process the seriesIds param when getting the query builder
	 *
	 * @param array $args
	 */
	protected function _getQueryBuilder($args = []) {
		$statsQB = parent::_getQueryBuilder($args);
		if (!empty(($args['seriesIds']))) {
			$statsQB->filterBySections($args['seriesIds']);
		}
		return $statsQB;
	}
}