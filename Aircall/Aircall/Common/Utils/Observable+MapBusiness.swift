//
//  Observable+MapBusiness.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import RxSwift
import Moya

extension ObservableType where E: Response {

	/**

		Custom operator retreiving payload or appropriate business error.

		- Parameters:
		  - payload: Payload to decode.
		  - decoder: JSONDecoder to use for producing the payload.

		- Returns: Usable payload, or meaning business error.

	*/
	func mapBusiness<P: Decodable>(
		payload: P.Type,
		using decoder: JSONDecoder
		) -> Observable<P> {
		return flatMap { (response: E) -> Single<P> in
			if let responseType = try? response.map(payload, using: decoder) {
				return Single.just(responseType)
			} else if let errorType = try? response.map(WSResponse.self) {
				throw AircallError(code: errorType.code)
			} else {
				throw AircallError.undocumented
			}
		}
	}

}
