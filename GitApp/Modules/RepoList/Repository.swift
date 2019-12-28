//
//  Repository.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

struct Repository: Decodable {
	let id: Int?
	let name: String?
	let owner: User?
	let description: String?
	let homepage: String?
	let size: Int?
	let language: String?
	let stars: Int?
	let forks: Int?
	let openIssues: Int?
	let subscribers: Int?
	
	private enum CodingKeys: String, CodingKey {
		case stars = "stargazers_count"
		case forks = "forks_count"
		case openIssues = "open_issues_count"
		case subscribers = "subscribers_count"
		case id = "id"
		case name = "name"
		case owner = "owner"
		case description = "description"
		case homepage = "homepage"
		case size = "size"
		case language = "language"
    }
}
