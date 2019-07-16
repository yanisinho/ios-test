//
//  Aircall.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Moya
import Alamofire

/// Aircall API definition.
enum Aircall: TargetType {

	// MARK: - Endpoints

	/// Retreive calls.
	case getCalls

	/// Reset calls.
	case resetCalls

	/// Retreive call.
	case getCall(callId: Int)

	/// Archive call
	case archiveCall(callId: Int)

	// MARK: - TargetType

	/// The target’s base URL.
	var baseURL: URL {
		return URL(string: "https://aircall-job.herokuapp.com")!
	}

	/// The path to be appended to baseURL to form the full URL.
	var path: String {
		switch self {
		case .getCalls:
			return "/activities"
		case .resetCalls:
			return "/reset"
		case .getCall(let callId),
				 .archiveCall(let callId):
			return "/activities/\(callId)"
		}
	}

	/// The HTTP method used in the request.
	var method: Moya.Method {
		switch self {
		case .getCalls,
				 .resetCalls,
				 .getCall:
			return .get
		case .archiveCall:
			return .post
		}
	}

	/// Provides parameters for each endpoint.
	var parameters: Alamofire.Parameters {
		var parameters = Parameters()
		switch self {
		case .archiveCall:
			parameters["is_archived"] = true
		default:
			break
		}
		return parameters
	}

	/// Provides parameters encoding for each endpoint.
	var encoding: ParameterEncoding {
		switch self {
		case .getCalls,
				 .resetCalls,
				 .getCall:
			return URLEncoding.default
		case .archiveCall:
			return JSONEncoding.default
		}
	}

	/// The type of HTTP task to be performed.
	var task: Task {
		return .requestParameters(
			parameters: parameters,
			encoding: encoding
		)
	}

	/// The headers to be used in the request.
	var headers: [String: String]? {
		return nil
	}

	/// Provides stub data for use in testing.
	var sampleData: Data {
		let resource: String = {
			switch self {
			case .getCalls:
				return "getCalls"
			case .resetCalls:
				return "resetCalls"
			case .getCall:
				return "getCall"
			case .archiveCall:
				return "archiveCall"
			}
		}()
		guard
			let url = Bundle.main.url(forResource: resource, withExtension: "json"),
			let data = try? Data(contentsOf: url) else {
				return Data()
		}
		return data
	}

}
