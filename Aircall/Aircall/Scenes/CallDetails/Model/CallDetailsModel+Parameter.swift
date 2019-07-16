//
//  CallDetailsModel+Parameter.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

extension CallDetailsModel {

	/// Search parameters.
	struct Parameter {

		/// Call identifier.
		let callId: Int

		/**

		`CallDetailsModel.Parameter` custom initializer from parameters.

		- Parameters:
		- callId: Call identifier.

		- Returns: `CallDetailsModel.Parameter` initialized and ready to use.

		*/
		init(
			callId: Int
			) {
			self.callId = callId
		}

	}

}
