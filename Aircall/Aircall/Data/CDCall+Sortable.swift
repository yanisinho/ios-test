//
//  CDCall+Sortable.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

// MARK: - Sortable

extension CDCall: Sortable {

	/// Configure `CDCall` grouping.
	var grouping: String {
		return dateShort
	}

	/// Configure `CDCall` category.
	var day: String {
		return dayString
	}

}
