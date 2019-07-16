//
//  CallDetailsViewModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

final class CallDetailsViewModel: ViewModel {

	typealias In = Input
	typealias Out = Output

	// MARK: - Input

	/// `CallDetailsViewModel` input.
	struct Input {

		// Emits an event when user press archive button.
		var archive: Observable<Void>

	}

	// MARK: - Output

	/// `CallDetailsViewModel` output.
	struct Output {

		/// Driver representing title property.
		var title: Driver<String>

		/// Driver representing from property.
		var from: Driver<String>

		/// Driver representing to property.
		var to: Driver<(String, String)>

		/// Driver representing createdAt property.
		var createdAt: Driver<String>

		/// Driver representing type property.
		var type: Driver<String>

		/// Driver representing direction property.
		var direction: Driver<String>

		/// Driver representing archived property.
		var archived: Driver<Bool>

		/// `Driver<WSError>` exposing error.
		var error: Driver<WSError>

	}

		/**

	Produce `ViewModel`'s output from `ViewModel`'s input.

	- Parameters:
	  - input: `ViewModel` input.

	- Returns: `ViewModel` output

	*/
	func setup(
		from input: CallDetailsViewModel.Input
		) -> CallDetailsViewModel.Output {
		
	}

}
