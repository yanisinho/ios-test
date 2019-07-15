//
//  Configurator.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/// Meta-structure centralizing configurators.
struct Configurator {

	/**

	Update view conforms to `CallDisplayable` protocol.

	- Parameters:
	  - view: The view to update.
	  - call: The call to use.

	*/
	static func update(
		_ view: CallDisplayable,
		with call: CallRepresentable
		) {
		view.typeImageView.image = UIImage(named: call.type)
		view.fromLabel.text = call.from
		view.createAtLabel.text = call.createdAt
		view.toLabel.text = {
			switch call.type {
			case "missed":
				return Localized.missed
			case "voicemail":
				return Localized.voicemail
			default:
				return "\(call.to)"
			}
		}()
	}

}
