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
import Moya

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

	// MARK: - Properties

	/// Coordinator
	weak var coordinator: CallDetailsCoordinator?

	/// Model
	private let model: CallDetailsModel

	/// Moya provider used for web services.
	private let provider: MoyaProvider<Aircall>

	/// JSONDecoder used with web services.
	private let decoder: JSONDecoder

	/// RxSwift dispose bag
	private let disposeBag = DisposeBag()

	/// Emits an event when call is updated.
	private var successBehavior: BehaviorRelay<WSCall?>

	/// Emits an event when table view refreshing status changed.
	private var errorBehavior: BehaviorRelay<WSError?>


	init(
		provider: MoyaProvider<Aircall>,
		decoder: JSONDecoder,
		coordinator: CallDetailsCoordinator,
		model: CallDetailsModel
		) {
		self.provider = provider
		self.decoder = decoder
		self.coordinator = coordinator
		self.model = model
		self.errorBehavior = BehaviorRelay(value: nil)
		self.successBehavior = BehaviorRelay(value: nil)
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
