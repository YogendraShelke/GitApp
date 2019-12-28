//
//  UIImageView+Extension.swift
//  GitApp
//
//  Created by Yogendra Shelke on 28/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
	
	func downloadTask(url: URL) -> URLSessionDataTask {
		return URLSession.shared.dataTask(with: url) {[weak self] (result) in
			switch result {
			case .success(let(_, data)):
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}
