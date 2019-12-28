//
//  CardView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class CardView: UIView {

	let cornerRadius: CGFloat = 2
	let shadowOffsetWidth: Int = 0
	let shadowOffsetHeight: Int = 2
	let shadowColor: UIColor? = .black
	let shadowOpacity: Float = 0.3
	let shadowRadius: CGFloat = 3
		
	override func layoutSubviews() {
		layer.cornerRadius = cornerRadius
		layer.masksToBounds = false
		layer.shadowColor = shadowColor?.cgColor
		layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
		layer.shadowOpacity = shadowOpacity
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
		layer.shadowRadius = shadowRadius
	}
}
