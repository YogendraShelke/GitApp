//
//  Router.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

enum Router: CustomStringConvertible {
	
	case getPublicRepos
	case getRepoDetails(owner: String, repoName: String)
	case getContributors(owner: String, repoName: String)
	case getLanguages(owner: String, repoName: String)
	case getBranches(owner: String, repoName: String)
	case getUserDetails(user: String)
	
	static let baseURL = "https://api.github.com"
	
	var description: String {
		switch self {
		case .getPublicRepos: return "\(Router.baseURL)/repositories"
		case .getRepoDetails(let owner, let repoName): return "\(Router.baseURL)/repos/\(owner)/\(repoName)"
		case .getContributors(let owner, let repoName): return "\(Router.baseURL)/repos/\(owner)/\(repoName)/contributors"
		case .getBranches(let owner, let repoName): return "\(Router.baseURL)/repos/\(owner)/\(repoName)/branches"
		case .getLanguages(let owner, let repoName): return "\(Router.baseURL)/repos/\(owner)/\(repoName)/languages"
		case .getUserDetails(let user): return "\(Router.baseURL)/users/\(user)"
		}
	}
}
