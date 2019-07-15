//
//  Theme.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

struct Theme {

	/// Theme configuration.
	@discardableResult init() {
		let appearance = UINavigationBar.appearance()
		appearance.tintColor = Color.secondary
		appearance.barTintColor = Color.primary
		appearance.titleTextAttributes = [
			.foregroundColor: Color.secondary as Any,
			.font: UIFont.preferredFont(forTextStyle: .title3)
		]
		appearance.largeTitleTextAttributes = [
			.foregroundColor: Color.secondary as Any,
			.font: UIFont.preferredFont(forTextStyle: .largeTitle)
		]
	}

}
