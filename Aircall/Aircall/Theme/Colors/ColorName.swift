//
//  ColorName.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/// All color names.
enum ColorName: String, CaseIterable {

	/// Primary color.
	case primary

	/// Secondary color.
	case secondary

	/// Title color.
	case title

	/// Subtitle color.
	case subtitle

	/// Background color.
	case background

	/// Retreive real color from xcassets.
	var color: UIColor {
		guard let color = UIColor(named: rawValue) else {
			fatalError("Please check Colors.xcassets (color named \(rawValue) not found).")
		}
		return color
	}

}
