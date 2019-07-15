//
//  CDCall+IdentifiableType.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import RxDataSources

// MARK: - IdentifiableType

extension CDCall: IdentifiableType {

	public typealias Identity = Int32

	/// Defines the property which acts as primary key.
	public var identity: Int32 {
		return id
	}

}
