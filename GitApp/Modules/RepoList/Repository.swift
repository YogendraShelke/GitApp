//
//  Repository.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import SwiftyJSON

class Repository: NSObject {
	var id: Int?
	var name: String?
	var owner: User?
	var desc: String?
	var homePage: String?
	var size: Int?
	var stars: Int?
	var watch: Int?
	var language: String?
	var forks: Int?
	var openIssues: Int?
	var subscribers: Int?
	
	init(json: JSON) {
		
		if let name = json["name"].string { self.name = name }
		if let id = json["id"].int { self.id = id }
		if let desc = json["description"].string { self.desc = desc }
		if let language = json["language"].string { self.language = language }
		if let homePage = json["homepage"].string { self.homePage = homePage }
		if let watch = json["subscribers_count"].int { self.watch = watch }
		if let size = json["size"].int { self.size = size }
		if let stars = json["stargazers_count"].int { self.stars = stars }
		if let forks = json["forks_count"].int { self.forks = forks }
		if let openIssues = json["open_issues_count"].int { self.openIssues = openIssues }
		if let subscribers = json["subscribers_count"].int { self.subscribers = subscribers }
		self.owner = User(json: json["owner"])
	}
}
