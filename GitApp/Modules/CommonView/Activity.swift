//
//  Activity.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import UIKit
import MBProgressHUD

class Activity {
	
	static let shared = Activity()
	private var spinner: MBProgressHUD?
	
	func show(in view: UIView) {
		spinner = MBProgressHUD.showAdded(to: view, animated: true)
		spinner?.margin = 20
		spinner?.bezelView.color = .black
		spinner?.contentColor = .white
	}
	
	func hide() {
		spinner?.hide(animated: true)
	}
	
	private func isAdded(to view: UIView) -> Bool {
		return spinner?.isDescendant(of: view) ?? false
	}
	
	func toast(in view: UIView, message: String) {
		
		if !isAdded(to: view) {
			spinner = MBProgressHUD.showAdded(to: view, animated: true)
		}
		spinner?.mode = .text
		spinner?.detailsLabel.text = message
		spinner?.removeFromSuperViewOnHide = true
		spinner?.margin = 20
		spinner?.bezelView.color = .black
		spinner?.contentColor = .white
		spinner?.hide(animated: true, afterDelay: 3)
	}
}
