//
//  CallListTableViewCell.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import Reusable

final class CallListTableViewCell: UITableViewCell, CallDisplayable, NibReusable {

	// MARK: - CallDisplayable

	@IBOutlet weak var typeImageView: UIImageView!
	@IBOutlet weak var fromLabel: ACTitleLabel!
	@IBOutlet weak var toLabel: ACSubtitleLabel!
	@IBOutlet weak var createAtLabel: ACSubtitleLabel!

	// MARK: - Lifecycle

	/// Prepares receiver for service after it has been loaded from an IB archive, or nib file.
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	/// Sets the selected state of the cell, optionally animating the transition between states.
	override func setSelected(
		_ selected: Bool,
		animated: Bool
		) {
		super.setSelected(
			selected,
			animated: animated
		)
			fromLabel.textColor = selected ? Color.secondary : Color.title
			toLabel.textColor = selected ? Color.secondary : Color.subtitle
			createAtLabel.textColor = selected ? Color.secondary : Color.subtitle
			backgroundColor = selected ? Color.primary : Color.secondary
	}

}
