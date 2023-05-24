<?php

/**
 * @file classes/monograph/RepresentativeDAO.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class RepresentativeDAO
 * @ingroup monograph
 * @see Representative
 *
 * @brief Operations for retrieving and modifying Representative (suppliers and agents) objects.
 */

import('classes.monograph.Representative');

class RepresentativeDAO extends DAO {
	/**
	 * Retrieve a representative entry by id.
	 * @param $representativeId int
	 * @param $monographId optional int
	 * @return Representative|null
	 */
	function getById($representativeId, $monographId = null) {
		$params = [(int) $representativeId];
		if ($monographId) $params[] = (int) $monographId;

		$result = $this->retrieve(
			'SELECT r.*
				FROM representatives r
			JOIN submissions s ON (r.submission_id = s.submission_id)
			WHERE r.representative_id = ?
				' . ($monographId?' AND s.submission_id = ?':''),
			$params
		);
		$row = $result->current();
		return $row ? $this->_fromRow((array) $row) : null;
	}

	/**
	 * Retrieve all supplier representatives for a monograph.
	 * @param $monographId int
	 * @return DAOResultFactory containing matching representatives.
	 */
	function getSuppliersByMonographId($monographId) {
		return new DAOResultFactory(
			$this->retrieveRange(
				'SELECT * FROM representatives WHERE submission_id = ? AND is_supplier = ?',
				[(int) $monographId, 1]
			),
			$this,
			'_fromRow'
		);
	}

	/**
	 * Retrieve all agent representatives for a monograph.
	 * @param $monographId int
	 * @return DAOResultFactory containing matching representatives.
	 */
	function getAgentsByMonographId($monographId) {
		return new DAOResultFactory(
			$this->retrieveRange(
				'SELECT * FROM representatives WHERE submission_id = ? AND is_supplier = ?',
				[(int) $monographId, 0]
			),
			$this,
			'_fromRow'
		);
	}

	/**
	 * Construct a new data object corresponding to this DAO.
	 * @return Representative
	 */
	function newDataObject() {
		return new Representative();
	}

	/**
	 * Internal function to return a Representative object from a row.
	 * @param $row array
	 * @param $callHooks boolean
	 * @return Representative
	 */
	function _fromRow($row, $callHooks = true) {
		$representative = $this->newDataObject();
		$representative->setId($row['representative_id']);
		$representative->setRole($row['role']);
		$representative->setRepresentativeIdType($row['representative_id_type']);
		$representative->setRepresentativeIdValue($row['representative_id_value']);
		$representative->setName($row['name']);
		$representative->setPhone($row['phone']);
		$representative->setEmail($row['email']);
		$representative->setUrl($row['url']);
		$representative->setIsSupplier($row['is_supplier']);
		$representative->setMonographId($row['submission_id']);

		if ($callHooks) HookRegistry::call('RepresentativeDAO::_fromRow', array(&$representative, &$row));

		return $representative;
	}

	/**
	 * Insert a new representative entry.
	 * @param $representative Representative
	 */
	function insertObject($representative) {
		$this->update(
			'INSERT INTO representatives
				(submission_id, role, representative_id_type, representative_id_value, name, phone, email, url, is_supplier)
			VALUES
				(?, ?, ?, ?, ?, ?, ?, ?, ?)',
			[
				(int) $representative->getMonographId(),
				$representative->getRole(),
				$representative->getRepresentativeIdType(),
				$representative->getRepresentativeIdValue(),
				$representative->getName(),
				$representative->getPhone(),
				$representative->getEmail(),
				$representative->getUrl(),
				(int) $representative->getIsSupplier()
			]
		);

		$representative->setId($this->getInsertId());
		return $representative->getId();
	}

	/**
	 * Update an existing representative entry.
	 * @param $representative Representative
	 */
	function updateObject($representative) {
		$this->update(
			'UPDATE representatives
				SET role = ?,
				representative_id_type = ?,
				representative_id_value = ?,
				name = ?,
				phone = ?,
				email = ?,
				url = ?,
				is_supplier = ?
			WHERE representative_id = ?',
			[
				$representative->getRole(),
				$representative->getRepresentativeIdType(),
				$representative->getRepresentativeIdValue(),
				$representative->getName(),
				$representative->getPhone(),
				$representative->getEmail(),
				$representative->getUrl(),
				(int) $representative->getIsSupplier(),
				(int) $representative->getId()
			]
		);
	}

	/**
	 * Delete a representative entry by object.
	 * @param $representative Representative
	 */
	function deleteObject($representative) {
		return $this->deleteById($representative->getId());
	}

	/**
	 * delete a representative entry by id.
	 * @param $entryId int
	 */
	function deleteById($entryId) {
		return $this->update(
			'DELETE FROM representatives WHERE representative_id = ?', [(int) $entryId]
		);
	}

	/**
	 * Get the ID of the last inserted representative entry.
	 * @return int
	 */
	function getInsertId() {
		return $this->_getInsertId('representatives', 'representative_id');
	}
}


