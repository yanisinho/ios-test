//
//  CallListViewModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

final class CallListViewModel: ViewModel {

	//swiftlint:disable type_name
	typealias In = Input
	typealias Out = Output
	//swiftlint:enable type_name

	// MARK: - Input

	/// `CallListViewModel` input.
	struct Input {

	}

	/// `CallListViewModel` output.
	struct Output {

	}

	/**

	Produce `ViewModel`'s output from `ViewModel`'s input.

	- Parameters:
	  - input: `ViewModel` input.

	- Returns: `ViewModel` output

	*/
	func setup(
		from input: CallListViewModel.Input
		) -> CallListViewModel.Output {

		return Output()

	}

}
