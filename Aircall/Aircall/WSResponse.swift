//
//  WSResponse.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Uniform response sent by web service.
struct WSResponse: Decodable {

	/// Response status.
	let status: String

	/// Response code.
	let code: String

	/// Response message.
	let message: String

	/// Custom `CodingKeys`.
	enum CodingKeys: String, CodingKey {
    case response
    case status
    case code
    case message
	}

	/// Custom `ServiceResponse` decoding.
	init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
    status = try response.decode(String.self, forKey: .status)
    code = try response.decode(String.self, forKey: .code)
    message = try response.decode(String.self, forKey: .message)
	}

}
