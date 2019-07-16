//
//  ShowCallDetails.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Reprensents an item which can access to present callDetails scene.
protocol ShowCallDetails: AnyObject {

	/// Accessing to call details scene.
	func showCallDetails(with callId: Int)

}
