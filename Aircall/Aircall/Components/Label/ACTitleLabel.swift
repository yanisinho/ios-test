//
//  ACTitleLabel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

Label representing Title element.

- note: This component can not be rendered at design time
- requires: `YSKit`

*/
final class ACTitleLabel: YSLabel {

	/// Design configuration.
  override func design() {
		textColor = Color.title
  }

}
