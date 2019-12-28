//
//  UIViewController+Extension.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import UIKit

extension UIViewController {
	func showActivity() {
		Activity.shared.show(in: view)
	}
	func hideActivity() {
		Activity.shared.hide()
	}
	func showToast(message: String) {
		Activity.shared.toast(in: view, message: message)
	}
}
