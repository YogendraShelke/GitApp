//
//  User.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

struct User: Decodable {
	let username: String?
	let avatar: String?
	let id: Int?
	let url: String?
	let reposUrl: String?
	let name: String?
	let company: String?
	let location: String?
	let blog: String?
	let publicRepos: Int?
	let publicGists: Int?
	let followers: Int?
	let following: Int?
	let createdOn: String?
	
	private enum CodingKeys: String, CodingKey {
		case username = "login"
		case avatar = "avatar_url"
		case reposUrl = "repos_url"
		case publicRepos = "public_repos"
		case publicGists = "public_gists"
		case createdOn = "created_at"
		case id, url, name, company, blog, location, followers, following
		
    }
}
