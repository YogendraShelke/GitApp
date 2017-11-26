//
//  BranchWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class BranchWireframe: NSObject {
	
	// VIPER Module Constants
	let kBranchStoryboardIdentifier = "Branch"
	let kBranchViewIdentifier = "BranchView"
	
	
	// MARK: - VIPER Stack
	lazy var moduleInteractor = BranchInteractor()
	lazy var modulePresenter = BranchPresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kBranchStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kBranchViewIdentifier) as! BranchView
	lazy var presenter : BranchWireframeToPresenterInterface = self.modulePresenter
	
	// MARK: - Instance Variables
	var delegate: BranchDelegate?
	
	// MARK: - Initialization
	override init() {
		super.init()
		
		let i = moduleInteractor
		let p = modulePresenter
		let v = moduleView
		
		i.presenter = p
		
		p.interactor = i
		p.view = v
		p.wireframe = self
		
		v.presenter = p
		
		presenter = p
	}
}
	
// MARK: - Wireframe Interface

extension BranchWireframe: BranchPresesnterToWireframeInterface {
	
}

// MARK: - Module Interface

extension BranchWireframe: BranchModuleInterface {
	func showBranches(repo: Repository) {
		presenter.showBranches(repo: repo)
	}
}
