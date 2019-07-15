//
//  ACRefreshControl.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

final class ACRefreshControl: YSRefreshControl {

	// MARK: - Private

	/// Configure attributedTitle.
	private func setupTitle() {
		attributedTitle = NSAttributedString(
			string: "title",
			attributes: [
				.foregroundColor: Color.secondary as Any,
				.font: UIFont.preferredFont(forTextStyle: .headline)
			]
		)
	}

	// MARK: - Public

	/// Called when the iOS interface environment changes.
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		setupTitle()
	}

	/// Specific design configuration.
	override func design() {
		super.design()
		tintColor = Color.secondary
		setupTitle()
	}

}
