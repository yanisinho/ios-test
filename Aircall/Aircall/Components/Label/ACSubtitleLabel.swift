//
//  ACSubtitleLabel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

Label representing Subtitle element.

- note: This component can not be rendered at design time
- requires: `YSKit`

*/
final class ACSubtitleLabel: YSLabel {

	/// Design configuration.
  override func design() {
		textColor = Color.subtitle
  }

}
