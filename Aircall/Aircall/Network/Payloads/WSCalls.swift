//
//  WSCalls.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/**

Payload data sent back from `getCalls` endpoint.

- Note:
For more informations, please visit the [official documentation](https://github.com/aircall/ios-test)

*/
struct WSCalls: Decodable {

	// MARK: - Properties

	/// Calls sent back from endpoint.
	let calls: [WSCall]

	// MARK: - Initializer

	/**

	Creates a new instance by decoding from the given decoder.

	This initializer throws an error if reading from the decoder fails,
	or if the data read is corrupted or otherwise invalid.

	- Parameters:
	  - decoder: The decoder to read data from.

	*/
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		calls = try container.decode([WSCall].self)
	}

}
