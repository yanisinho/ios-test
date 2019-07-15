//
//  LocalizedKey.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

enum LocalizedKey: String, CaseIterable {

	/// Localized string activity title.
	case title

	/// Localized string representing missed call.
	case missed

	/// Localized string representing voicemail.
	case voicemail

	/// Localized string representing refreshControl.
	case refreshControl

	/// Localized string representing all scope.
	case all

	/// Localized string representing archived scope.
	case archived

	/// Localized string representing unarchived scope.
	case unarchived

	/// Localized string representing mapping error.
	case mappingError

	/// Localized string representing network error.
	case networkError

	/// Localized string representing server error.
	case serverError

	/// Localized string representing business error.
	case businessError

	/// Localized string representing unknown error.
	case unknownError

	/// Localized string.
	var value: String {
		switch self {
		case .title:
			return NSLocalizedString(
				"Activity",
				comment: "Title: Activity"
			)
		case .missed:
			return NSLocalizedString(
				"missed call",
				comment: "Call.Type.missed: missed call"
			)
		case .voicemail:
			return NSLocalizedString(
				"left a voicemail",
				comment: "Call.Type.voicemail: left a voicemail"
			)
		case .refreshControl:
			return NSLocalizedString(
				"Please wait, we are updating data",
				comment: "Refresh: Message"
			)
		case .all:
			return NSLocalizedString(
				"All",
				comment: "Scope: All"
			)
		case .archived:
			return NSLocalizedString(
				"Archived",
				comment: "Scope: Archived"
			)
		case .unarchived:
			return NSLocalizedString(
				"Unarchived",
				comment: "Scope: Unarchived"
			)
		case .mappingError:
			return NSLocalizedString(
				"Mapping error",
				comment: "Error: Mapping"
			)
		case .networkError:
			return NSLocalizedString(
				"Network error",
				comment: "Error: Network"
			)
		case .serverError:
			return NSLocalizedString(
				"Server error",
				comment: "Error: Server"
			)
		case .businessError:
			return NSLocalizedString(
				"Business error",
				comment: "Error: Business"
			)
		case .unknownError:
			return NSLocalizedString(
				"Unknown error",
				comment: "Error: Unknown"
			)
		}
	}

}
