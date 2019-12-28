//
//  RepoService.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import Foundation


class RepoService: Service {
	static let shared = RepoService()
	
	func getPublicRepos(result: @escaping (Result<[Repository], APIError>) -> Void) {
		fetch(urlString: Router.getPublicRepos.description, completion: result)
	}
	
	func getRepoDetails(repo: Repository, result: @escaping (Result<Repository, APIError>) -> Void)  {
		guard let owner = repo.owner?.username, let repoName = repo.name else {
			result(.failure(.invalidQueryParams))
			return
		}
		fetch(urlString: Router.getRepoDetails(owner: owner, repoName: repoName).description, completion: result)
	}
	
	func getContributors(repo: Repository, result: @escaping (Result<[User], APIError>) -> Void)  {
		guard let owner = repo.owner?.username, let repoName = repo.name else {
			result(.failure(.invalidQueryParams))
			return
		}
		fetch(urlString: Router.getContributors(owner: owner, repoName: repoName).description, completion: result)
	}
	func getBranches(repo: Repository, result: @escaping (Result<[Branch], APIError>) -> Void)  {
		guard let owner = repo.owner?.username, let repoName = repo.name else {
			result(.failure(.invalidQueryParams))
			return
		}
		fetch(urlString: Router.getBranches(owner: owner, repoName: repoName).description, completion: result)
	}
}
