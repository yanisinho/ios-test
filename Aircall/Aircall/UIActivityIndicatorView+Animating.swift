//
//  UIActivityIndicatorView+Animating.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {

	/// `UIActivityIndicatorView` animating sugar synthax.
	func animating(_ value: Bool) {
		if value {
			startAnimating()
		} else {
			stopAnimating()
		}
	}

}
