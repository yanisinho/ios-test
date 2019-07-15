//
//  CallType.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Represents call's type.
enum CallType: String, CaseIterable, Codable {

	/// Inbound call.
	case missed

	/// Outbound call.
	case answered

	/// Outbound call.
	case voicemail

	/// Unknown call type.
	case unknown

}
