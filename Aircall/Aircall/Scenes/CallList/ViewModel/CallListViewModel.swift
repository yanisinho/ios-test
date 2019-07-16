//
//  CallListViewModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import RxSwift
import RxCocoa
import Moya

final class CallListViewModel: ViewModel {

	//swiftlint:disable type_name
	typealias In = Input
	typealias Out = Output
	//swiftlint:enable type_name

	// MARK: - Input

	/// `CallListViewModel` input.
	struct Input {

		/// Emits an event when user refresh table view.
		var refresh: Observable<Void>

		// Emits an event when user press reset button.
		var reset: Observable<Void>

		// Emits an event when user select call.
		var select: Observable<CDCall>

	}

	// MARK: - BehaviorRelay

	/// Emits an event when table view refreshing status changed.
	private var isLoadingBehavior: BehaviorRelay<Bool>

	/// Emits an event when table view refreshing status changed.
	private var errorBehavior: BehaviorRelay<WSError?>

	/// `CallListViewModel` output.
	struct Output {

	}

	// MARK: - Properties

	/// Moya provider used for web services.
	private let provider: MoyaProvider<Aircall>

	/// JSONDecoder used with web services.
	private let decoder: JSONDecoder

	/// Coordinator
	weak var coordinator: ShowCallDetails?

	/// Model coordinator
	private let model: CallListModel

	/// RxSwift dispose bag
	private let disposeBag = DisposeBag()

	// MARK: - Initializer

	/**

	`CallListViewModel` custom initializer.

	- Parameters:
	  - provider: MoyaProvider to use to make network requests.
		- decoder: JSONDecoder to use with provider.
		- coordinator: Associated coordinator to manage navigation.
		- model: Model responsible to retreive the stored data.

	- Returns: Fully fledged CallListViewModel object.

	*/
	init(
		provider: MoyaProvider<Aircall>,
		decoder: JSONDecoder,
		coordinator: CallListCoordinator,
		model: CallListModel
		) {
		self.provider = provider
		self.decoder = decoder
		self.coordinator = coordinator
		self.model = model
		self.errorBehavior = BehaviorRelay(value: nil)
		self.isLoadingBehavior = BehaviorRelay(value: false)
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

// MARK: - Network

extension CallListViewModel {

	/// Represents an observable of calls
	typealias CallsEvent = Observable<Event<WSCalls>>
	typealias ResetEvent = Observable<Event<WSReset>>

	/**

	Retreive calls from web service.

	- Parameters:
	  - id: The call identifier.

	- Returns: Observable of Event<WSCalls>

	*/
	private func getCalls() -> CallsEvent {
		return provider.rx
			.request(.getCalls)
			.asObservable()
			.mapBusiness(payload: WSCalls.self, using: decoder)
			.materialize()
	}

	/**

	Reset calls from web service.

	- Parameters:
	  - id: The call identifier.

	- Returns: Observable of Event<WSCalls>

	*/
	private func resetCalls() -> ResetEvent {
		return provider.rx
			.request(.resetCalls)
			.asObservable()
			.mapBusiness(payload: WSReset.self, using: decoder)
			.materialize()
	}

}
