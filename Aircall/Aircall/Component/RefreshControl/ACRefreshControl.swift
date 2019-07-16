//
//  ACRefreshControl.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

Refresh control representing network activity.

- note: This component can be rendered at design time
- requires: `YSKit`

*/
final class ACRefreshControl: YSRefreshControl {

	/// Design configuration.
	override func design() {
		super.design()
		tintColor = Color.secondary
		setupTitle()
	}

	/// Called when the iOS interface environment changes.
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		setupTitle()
	}

	// MARK: - Private

	/// Configure attributedTitle.
	private func setupTitle() {
		attributedTitle = NSAttributedString(
			string: LocalizedString.refreshControl,
			attributes: [
				.foregroundColor: Color.secondary as Any,
				.font: UIFont.preferredFont(forTextStyle: .headline)
			]
		)
	}

}
