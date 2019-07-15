//
//  CallRepresentable.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Describes an item which can be used to represent a call.
//swiftlint:disable identifier_name
protocol CallRepresentable {

	/// Call from value.
	var from: String { get }

	/// Call to value.
	var to: String { get }

	/// Call type value.
	var type: String { get }

	/// Call creation date value.
	var createdAt: String { get }
}
//swiftlint:enable identifier_name
