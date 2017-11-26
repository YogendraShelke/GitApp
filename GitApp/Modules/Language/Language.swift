//
//  Language.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import SwiftyJSON

class Language: NSObject {
	var name: String?
	var value: Int?
	
	private init(name: String, value: Int?) {
		self.name = name
		self.value = value
	}
	
	class func initWithObject(object: JSON) -> [Language] {
		var languages: [Language] = []
		for language in object {
			languages.append(Language(name: language.0, value: language.1.int))
		}
		return languages
	}
}
