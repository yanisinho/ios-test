//
//  WSReset.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/**

Payload data sent back from `activityReset` endpoint.

- Note:
For more informations, please visit the [official documentation](https://github.com/aircall/ios-test)

*/
struct WSReset: Codable {

	/// Reset message.
	let message: String

}
