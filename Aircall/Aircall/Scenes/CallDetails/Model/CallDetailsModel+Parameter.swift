//
//  CallDetailsModel+Parameter.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

extension CallDetailsModel {

	/// Parameters used by `FetchRequest`.
	struct Parameter {

		/// Call identifier.
		let callId: Int

		// MARK: - Initializer

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
