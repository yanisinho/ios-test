//
//  Localized.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Structure referencing all localized strings.
struct Localized {

	/// Localized string activity title.
	static var title = LocalizedKey.title.value

	/// Localized string representing missed call.
	static var missed = LocalizedKey.missed.value

	/// Localized string representing voicemail.
	static var voicemail = LocalizedKey.voicemail.value

	/// Localized string representing refreshControl.
	static var refreshControl = LocalizedKey.refreshControl.value

	/// Localized string representing all scope.
	static var all = LocalizedKey.all.value

	/// Localized string representing archived scope.
	static var archived = LocalizedKey.archived.value

	/// Localized string representing unarchived scope.
	static var unarchived = LocalizedKey.unarchived.value

	/// Localized string representing network error.
	static var networkError = LocalizedKey.networkError.value

	/// Localized string representing server error.
	static var serverError = LocalizedKey.serverError.value

	/// Localized string representing business error.
	static var businessError = LocalizedKey.businessError.value

	/// Localized string representing mapping error.
	static var mappingError = LocalizedKey.mappingError.value

	/// Localized string representing unknown error.
	static var unknownError = LocalizedKey.unknownError.value

}
