//
//  CallListModel+Parameter.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

extension CallListModel {

	/// Parameters used by `FetchRequest`.
	struct Parameter {

		/// Search scope.
		let scope: CDCall.Scope

		/// Search ascending.
		let ascending: Bool

		// MARK: - Initializer

		/**

		`CallListModel.Parameter` custom initializer from parameters.

		- Parameters:
		  - scope: The scope search [CDCall.Scope]
		  - ascending: The ordering seacrh [Bool] (default: true)

		- Returns: `CallListModel.Parameter` initialized and ready to use.

		*/
		init(
			scope: CDCall.Scope,
			ascending: Bool = true
			) {
			self.scope = scope
			self.ascending = ascending
		}

	}

}
