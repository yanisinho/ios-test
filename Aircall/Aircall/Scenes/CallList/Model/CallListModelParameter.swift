//
//  CallListModelParameter.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Search parameters.
struct CallListModelParameter {

	/// Search scope.
	let scope: CDCall.Scope

	/// Search ascending.
	let ascending: Bool

	/**

	`CallListModelParameter` custom initializer from parameters.

	- Parameters:
		- scope: The scope search [CDCall.Scope]
		- ascending: The ordering seacrh [Bool] (default: true)

	- Returns: `CallListModelParameter` initialized and ready to use.

	*/
	init(
		scope: CDCall.Scope,
		ascending: Bool = true
	) {
		self.scope = scope
		self.ascending = ascending
	}

}
