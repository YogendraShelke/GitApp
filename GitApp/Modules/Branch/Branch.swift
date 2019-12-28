//
//  Branch.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

struct Commit: Decodable {
	let sha: String?
	let url: String
}

struct Branch: Decodable {
	let name: String?
	let commit: Commit?
}
