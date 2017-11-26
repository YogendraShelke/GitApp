//
//  Router.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
	
	case getPublicRepos
	case getRepoDetails(owner: String, repoName: String)
	case getContributors(owner: String, repoName: String)
	case getLanguages(owner: String, repoName: String)
	case getBranches(owner: String, repoName: String)
	case getUserDetails(user: String)
	
	static let baseURLString = "https://api.github.com"
	
	var method: HTTPMethod {
		switch self {
		case .getPublicRepos, .getRepoDetails, .getContributors, .getBranches, . getLanguages, .getUserDetails: return .get
		}
	}
	
	var path: String {
		switch self {
		case .getPublicRepos: return "/repositories"
		case .getRepoDetails(let owner, let repoName): return "/repos/\(owner)/\(repoName)"
		case .getContributors(let owner, let repoName): return "/repos/\(owner)/\(repoName)/contributors"
		case .getBranches(let owner, let repoName): return "/repos/\(owner)/\(repoName)/branches"
		case .getLanguages(let owner, let repoName): return "/repos/\(owner)/\(repoName)/languages"
		case .getUserDetails(let user): return "/users/\(user)"
		}
	}
	
	// MARK: URLRequestConvertible
	
	func asURLRequest() throws -> URLRequest {
		let url = try Router.baseURLString.asURL()
		
		var urlRequest = URLRequest(url: url.appendingPathComponent(path))
		urlRequest.httpMethod = method.rawValue
		
		return urlRequest
	}
}
