//
//  Banner.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import NotificationBannerSwift

/// Responsible of displaying banner all over the application
struct Banner {

	/// Banner title.
	var title: String

	/// Banner subtitle.
	var subtitle: String

	/// Banner type.
	var style: BannerStyle

	/// Banner notification
	var notification: GrowingNotificationBanner {
		return GrowingNotificationBanner(
			title: title,
			subtitle: subtitle,
			style: style
		)
	}

	/**

	Banner initializer.

	- Parameters:
	  - title: Banner title.
	  - subtitle: Banner subtitle.
	  - style: Banner style.

	- Returns: Banner with

	*/
	init(
		title: String,
		subtitle: String,
		style: BannerStyle = .none
	) {
		self.title = title
		self.subtitle = subtitle
		self.style = style
	}

}
