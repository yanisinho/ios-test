//
//  YSLabel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**
`UILabel` subclass

View that displays one or more lines of read-only text,
often used in conjunction with controls to describe their intended purpose.

[Apple's documentation for UILabel](https://developer.apple.com/documentation/uikit/uilabel)

- note: This component can be rendered at design time
- requires: `UIKit`
*/
@IBDesignable
open class YSLabel: UILabel {

	/// Called when a designable object is created in Interface Builder.
	open override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		design()
	}

	/// Initializes and returns a newly allocated view object with the specified frame rectangle.
	public override init(frame: CGRect) {
		super.init(frame: frame)
		design()
	}

	/// Initializes and returns a newly allocated view object deserialized.
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		design()
	}

	/// Implemented by subclasses to initialize a new object (the receiver) immediately after memory for it has been allocated.
	public convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
	}

	/// Global design configuration.
	open func design() {

	}

}
