//
//  Branch.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import SwiftyJSON

class Branch: NSObject {
	var name: String?
	var sha: String?
	var commitUrl: String?
	
	init(json: JSON) {
		
		if let name = json["name"].string { self.name = name }
		if let sha = json["commit"]["sha"].string { self.sha = sha }
		if let commitUrl = json["commit"]["url"].string { self.commitUrl = commitUrl }
	}
}
