//
//  RepoCell.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var desc: UILabel!
	@IBOutlet weak var avatar: UIImageView!
	
	override func layoutSubviews() {
		super.layoutSubviews()
		avatar.layer.cornerRadius = avatar.frame.size.width/2
		avatar.layer.borderWidth = 2
		avatar.layer.borderColor = UIColor.white.cgColor
		avatar.clipsToBounds = true
	}
}
