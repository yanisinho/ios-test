//
//  LocalizedString.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Structure referencing all localized strings.
struct LocalizedString {

	/// Localized string activity title.
	static var title = LocalizedKey.title.string

	/// Localized string representing missed call.
	static var missed = LocalizedKey.missed.string

	/// Localized string representing voicemail.
	static var voicemail = LocalizedKey.voicemail.string

	/// Localized string representing refreshControl.
	static var refreshControl = LocalizedKey.refreshControl.string

	/// Localized string representing all scope.
	static var all = LocalizedKey.all.string

	/// Localized string representing archived scope.
	static var archived = LocalizedKey.archived.string

	/// Localized string representing unarchived scope.
	static var unarchived = LocalizedKey.unarchived.string

	/// Localized string representing network error.
	static var networkError = LocalizedKey.networkError.string

	/// Localized string representing server error.
	static var serverError = LocalizedKey.serverError.string

	/// Localized string representing business error.
	static var businessError = LocalizedKey.businessError.string

	/// Localized string representing mapping error.
	static var mappingError = LocalizedKey.mappingError.string

	/// Localized string representing unknown error.
	static var unknownError = LocalizedKey.unknownError.string

}
