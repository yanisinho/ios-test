//
//  AircallError.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Moya

/**

`Aircall` API errors.

This errors must be considered as business errors.

- Note:
For more informations, please visit the [official documentation](https://github.com/aircall/ios-test)

*/
public enum AircallError: Error, CaseIterable {

	/// Undocumented error.
	case undocumented

}

extension AircallError {

	/**

	`AircallError` custom initializer.

	Initialize from business error code sent back from backend.

	- Parameters:
	- code: The business error code. [String]

	*/
	init(code: String) {
		switch code {
		default:
			self = .undocumented
		}
	}

}

extension AircallError {

	/**

	Build `WSError` payload from generic Error.

	- Parameters:
	  - error: The error to analyse.

	- Returns: `WSError` ready to be used.

	*/
	static func payload(from error: Error) -> WSError {
		let title: String = {
			if let error = error as? MoyaError {
				switch error {
				case .objectMapping:
					return LocalizedString.mappingError
				case .underlying:
					return LocalizedString.networkError
				case .statusCode:
					return LocalizedString.serverError
				default:
					return LocalizedString.unknownError
				}
			} else if error is AircallError {
				return LocalizedString.businessError
			}
			return LocalizedString.unknownError
		}()
		return WSError(
			error: error,
			banner: Banner(
				title: title,
				subtitle: error.localizedDescription,
				style: .danger
			)
		)
	}

}
