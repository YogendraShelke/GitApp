//
//  RepoCell.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
	
	private var task: URLSessionDataTask?
	
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var desc: UILabel!
	@IBOutlet weak var avatar: UIImageView!
	
	func configure(title: String?, desc: String?, imageUrl: String?) {
		self.title?.text = title
		self.desc?.text = desc
		if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
			task = avatar.downloadTask(url: url)
			task?.resume()
		}
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		avatar.layer.cornerRadius = avatar.frame.size.width/2
		avatar.layer.borderWidth = 2
		avatar.layer.borderColor = UIColor.white.cgColor
		avatar.clipsToBounds = true
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		task?.cancel()
        task = nil
        avatar.image = nil
	}
}
