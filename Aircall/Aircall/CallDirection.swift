//
//  CallDirection.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Represents call's direction.
enum CallDirection: String, CaseIterable, Codable {

	/// Inbound call.
	case inbound

	/// Outbound call.
	case outbound

	/// Unknown call direction.
	case unknown

}
