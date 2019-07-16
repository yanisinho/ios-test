//
//  CallDetailsModelParameter.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Search parameters.
struct CallDetailsModelParameter {

	/// Call identifier.
	let callId: Int

	/**

	`CallDetailsModelParameter` custom initializer from parameters.

	- Parameters:
		- callId: Call identifier.

	- Returns: `CallDetailsModelParameter` initialized and ready to use.

	*/
	init(
		callId: Int
	) {
		self.callId = callId
	}

}
