//
//  UserService.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import Foundation

class UserService: Service {
	static let shared = UserService()
	func getUserDetails(user: User, result: @escaping (Result<User, APIError>) -> Void)  {
		guard let username = user.username else {
			result(.failure(.invalidQueryParams))
			return
		}
		fetch(urlString: Router.getUserDetails(user: username).description, completion: result)
	}
}
