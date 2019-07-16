//
//  CallListViewModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import RxSwift
import RxSwiftExt
import RxCocoa
import Moya
import RxDataSources

final class CallListViewModel: ViewModel {

	//swiftlint:disable type_name
	typealias In = Input
	typealias Out = Output
	//swiftlint:enable type_name

	// MARK: -

	/// `CallListViewModel` input.
	struct Input {

		/// Emits an event when user refresh table view.
		var refresh: Observable<Void>

		// Emits an event when user press reset button.
		var reset: Observable<Void>

		// Emits an event when user select call.
		var select: Observable<CDCall>

	}

	// MARK: -

	/// `CallListViewModel` output.
	struct Output {

		/// Observable exposing activities retreived from core data and ordered by section.
		var dataSource: Observable<[AnimatableSectionModel<String, CDCall>]>

		/// `Observable<Void>` exposing cancel action.
		var reset: Observable<Void>

		/// `Observable<CDCall>` exposing select action.
		var select: Observable<Int>

		/// `Driver<WSError>` exposing error.
		var error: Driver<WSError>

		/// `Driver<WSError>` exposing loading status.
		var isLoading: Driver<Bool>

	}

	// MARK: - Properties

	/// Coordinator
	weak var coordinator: ShowCallDetails?

	/// Emits an event when table view refreshing status changed.
	private var isLoadingBehavior: BehaviorRelay<Bool>

	/// Emits an event when table view refreshing status changed.
	private var errorBehavior: BehaviorRelay<WSError?>

	/// Moya provider used for web services.
	private let provider: MoyaProvider<Aircall>

	/// JSONDecoder used with web services.
	private let decoder: JSONDecoder

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

	// MARK: - Public methods

	func update() {
		self.getCalls()
			.subscribe(onNext: { event in
				self.onNext(event: event)
			}, onError: { error in
				self.onError(error: error)
			}).disposed(by: disposeBag)
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

		input.reset.flatMap({
			self.resetCalls()
		}).flatMap({ _ in
			self.getCalls()
		}).subscribe(onNext: { event in
			self.onNext(event: event)
		}, onError: { error in
			self.onError(error: error)
		}).disposed(by: disposeBag)

		input.refresh.flatMap({
			self.getCalls()
		}).subscribe(onNext: { event in
			self.onNext(event: event)
		}, onError: { error in
			self.onError(error: error)
		}).disposed(by: disposeBag)

		let data = model.read(
			parameter: CallListModel.Parameter(scope: .unarchived)
		)

		return Output(
			dataSource: data,
			reset: input.reset,
			select: input.select
				.map({call in return Int(call.id)})
				.do(onNext: {	callId in
					self.coordinator?.showCallDetails(with: callId)
				}),
			error: errorBehavior.asDriver(onErrorJustReturn: nil).unwrap(),
			isLoading: isLoadingBehavior.asDriver()
		)

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

// MARK: - Side effects

extension CallListViewModel {

	/**

	Side effects when an event is emitted.

	- Parameters:
	  - event: The event to use.

	*/
	private func onNext(
		event: Event<WSCalls>
		) {
		switch event {
		case .next(let content):
			model.update(calls: content.calls)
		case .error(let error):
			errorBehavior.accept(AircallError.payload(from: error))
		case .completed:
			break
		}
		isLoadingBehavior.accept(false)
	}

	/**

	Side effects when an error is emitted.

	- Parameters:
	  - event: The event to use.

	*/
	private func onError(
		error: Error
		) {
		errorBehavior.accept(AircallError.payload(from: error))
	}

}
