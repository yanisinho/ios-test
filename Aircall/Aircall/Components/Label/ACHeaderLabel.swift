//
//  ACHeaderLabel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

Label embedded inside TableViewCell header.

- note: This component can not be rendered at design time
- requires: `YSKit`

*/
final class ACHeaderLabel: YSLabel {

	/// Design configuration.
  override func design() {
		textColor = Color.secondary
		backgroundColor = Color.primary
  }

  // MARK: - Initializer

	/// Convenience initializer
	public convenience init() {
		self.init(frame: CGRect.zero)
	}

	/**

	Custom convenience initializer.

	- Parameters:
	  - title: The text to display.

	*/
	public convenience init(title: String) {
		self.init()
		text = "  " + title
	}

}
