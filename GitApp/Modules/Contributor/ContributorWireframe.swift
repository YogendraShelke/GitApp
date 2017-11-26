//
//  ContributorWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class ContributorWireframe: NSObject {
	
	// VIPER Module Constants
	let kContributorStoryboardIdentifier = "Contributor"
	let kContributorViewIdentifier = "ContributorView"
	
	// MARK: - VIPER Stack
	lazy var moduleInteractor = ContributorInteractor()
	lazy var modulePresenter = ContributorPresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kContributorStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kContributorViewIdentifier) as! ContributorView
	lazy var presenter : ContributorWireframeToPresenterInterface = self.modulePresenter
	
	// MARK: - Instance Variables
	var delegate: ContributorDelegate?
	
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

extension ContributorWireframe: ContributorPresesnterToWireframeInterface {
	func showDetails(user: User) {
		let userModule = UserWireframe()
		moduleView.navigationController?.pushViewController(userModule.moduleView, animated: true)
		let backItem = UIBarButtonItem()
		backItem.title = "Back"
		moduleView.navigationItem.backBarButtonItem = backItem
		userModule.showDetails(user: user)
	}
}

// MARK: - Module Interface

extension ContributorWireframe: ContributorModuleInterface {
	func showContributors(repo: Repository) {
		presenter.showContributors(repo: repo)
	}
}
