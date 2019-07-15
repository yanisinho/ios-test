//
//  ACHeaderLabel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

final class ACHeaderLabel: YSLabel {

	public convenience init() {
		self.init(frame: CGRect.zero)
	}

	public convenience init(title: String) {
		self.init()
		text = "  " + title
	}

	/// Specific design configuration.
  override func design() {
		textColor = Color.secondary
		backgroundColor = Color.primary
  }

}
