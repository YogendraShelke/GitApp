//
//  User.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {
	var userName: String?
	var profilePicUrl: String?
	var id: Int?
	var profileUrl: String?
	var reposUrl: String?
	var name: String?
	var company: String?
	var location: String?
	var blog: String?
	var publicRepos: Int?
	var publicGists: Int?
	var followers: Int?
	var following: Int?
	var createdOn: String?
	
	init(json: JSON) {
		if let userName = json["login"].string { self.userName = userName }
		if let id = json["id"].int { self.id = id }
		if let profilePicUrl = json["avatar_url"].string { self.profilePicUrl = profilePicUrl }
		if let profileUrl = json["url"].string { self.profileUrl = profileUrl }
		if let reposUrl = json["repos_url"].string { self.reposUrl = reposUrl }
		if let name = json["name"].string { self.name = name }
		if let company = json["company"].string { self.company = company }
		if let blog = json["blog"].string { self.blog = blog }
		if let location = json["location"].string { self.location = location }
		if let publicRepos = json["public_repos"].int { self.publicRepos = publicRepos }
		if let publicGists = json["public_gists"].int { self.publicGists = publicGists }
		if let followers = json["followers"].int { self.followers = followers }
		if let following = json["following"].int { self.following = following }
		if let createdOn = json["created_at"].string { self.createdOn = createdOn }
	}
}
