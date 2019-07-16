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

//swiftlint:disable identifier_name type_name
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
		var to: Driver<String>

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

		input.archive.flatMap({ _ in
			self.archiveCall(id: self.model.callId)
		}).subscribe(onNext: { event in
			self.onNext(event: event)
		}, onError: { error in
			self.onError(error: error)
		}).disposed(by: disposeBag)

		let success = successBehavior.asDriver().unwrap()

		return CallDetailsViewModel.Output(
			title: success.map {$0.from},
			from: success.map {$0.from},
			to: success.map {
				switch $0.type {
				case "missed":
					return LocalizedString.missed
				case "voicemail":
					return LocalizedString.voicemail
				default:
					return $0.to
				}
			},
			createdAt: success.map {$0.createdAt},
			type: success.map {$0.type},
			direction: success.map {$0.direction},
			archived: success.map {$0.isArchived},
			error: errorBehavior.asDriver().unwrap()
		)

	}

	/// Retreive `CDCall` from persistence store.
	func retreive() {
		let parameter = CallDetailsModel.Parameter(callId: model.callId)
		model
			.read(parameter: parameter)
			.unwrap()
			.map { call in
				return WSCall(
					id: Int(call.id),
					from: call.from,
					to: call.to,
					via: call.via,
					isArchived: call.isArchived,
					duration: Int(call.id),
					created: call.created as Date,
					callType: CallType(rawValue: call.type) ?? .unknown,
					callDirection: CallDirection(rawValue: call.direction) ?? .unknown
				)
			}.subscribe(onNext: { call in
				self.successBehavior.accept(call)
			}).disposed(by: disposeBag)

	}

	/// Reload web service.
	func reload() {
		self.getCall(id: self.model.callId)
			.subscribe(onNext: { event in
				self.onNext(event: event)
			}, onError: { error in
				self.onError(error: error)
			}).disposed(by: disposeBag)
	}

}

// MARK: - Network

extension CallDetailsViewModel {

	/// Represents an observable of call
	typealias CallEvent = Observable<Event<WSCall>>

	/**

	Retreive call from web service.

	- Parameters:
	- id: The call identifier.

	- Returns: Observable of Event<Call>

	*/
	private func getCall(
		id: Int
		) -> CallEvent {
		return provider.rx
			.request(.getCall(callId: id))
			.asObservable()
			.mapBusiness(payload: WSCall.self, using: decoder)
			.materialize()
	}

	/**

	Archive call from web service.

	- Parameters:
	- id: The call identifier.

	- Returns: Observable of Event<WSCall>

	*/
	private func archiveCall(
		id: Int
		) -> CallEvent {
		return provider.rx
			.request(.archiveCall(callId: id))
			.asObservable()
			.mapBusiness(payload: WSCall.self, using: decoder)
			.materialize()
	}

}

// MARK: - Side effects

extension CallDetailsViewModel {

	/**

	Side effects when an event is emitted.

	- Parameters:
	  - event: The event to use.

	*/
	private func onNext(
		event: Event<WSCall>
		) {
		switch event {
		case .next(let call):
			model.update(call: call)
			successBehavior.accept(call)
		case .error(let error):
			errorBehavior.accept(AircallError.payload(from: error))
		case .completed:
			break
		}
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
//swiftlint:enable identifier_name type_name
