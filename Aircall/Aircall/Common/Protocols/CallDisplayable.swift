//
//  CallDisplayable.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/// Describes an item which can be used to display a call.
@objc protocol CallDisplayable {

	/// Label displaying from value.
	var fromLabel: ACTitleLabel! { get set }

	/// Label displaying to value.
	var toLabel: ACSubtitleLabel! { get set }

	/// ImageView displaying type value.
	var typeImageView: UIImageView! { get set }

	/// Label displaying createdAt value.
	var createAtLabel: ACSubtitleLabel! { get set }

}
