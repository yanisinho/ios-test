//
//  AircallError+LocalizedError.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

extension AircallError: LocalizedError {

	/// A localized message describing what error occurred.
	public var errorDescription: String? {
		switch self {
		case .undocumented:
			return "Error is undocumented."
		}
	}

	/// A localized message describing the reason for the error.
	public var failureReason: String? {
		switch self {
		case .undocumented:
			return "The business error is unknown."
		}
	}

	/// A localized message describing how one might recover from the failure.
	public var recoverySuggestion: String? {
		switch self {
		case .undocumented:
			return "Please contact the administrator."
		}
	}

	/// A localized message providing "help" text if the user requests help.
	public var helpAnchor: String? {
		switch self {
		case .undocumented:
			return "https://poeditor.com/docs/error_codes"
		}
	}

}
