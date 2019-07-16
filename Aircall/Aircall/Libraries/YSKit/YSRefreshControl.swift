//
//  YSRefreshControl.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

`UIRefreshControl` subclass

A standard control that can initiate the refreshing of a table view’s contents.

[Apple's documentation for UIRefreshControl](https://developer.apple.com/documentation/uikit/uirefreshcontrol)

- note: This component can not be rendered at design time
- requires: `UIKit`

*/
@IBDesignable
open class YSRefreshControl: UIRefreshControl {

	/// Global design configuration.
	open func design() {

	}

	// MARK: - Initializer

	/// Implemented by subclasses to initialize a new object (the receiver)
	// immediately after memory for it has been allocated.
	public convenience override init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
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

	// MARK: - Interface Builder

	/// Called when a designable object is created in Interface Builder.
	open override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		design()
	}

}
