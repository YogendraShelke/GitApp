//
//  UserWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class UserWireframe: NSObject {
	
	// VIPER Module Constants
	let kUserStoryboardIdentifier = "User"
	let kUserViewIdentifier = "UserView"
	
	// MARK: - VIPER Stack
	lazy var moduleInteractor = UserInteractor()
	lazy var modulePresenter = UserPresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kUserStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kUserViewIdentifier) as! UserView
	lazy var presenter : UserWireframeToPresenterInterface = self.modulePresenter

	// MARK: - Instance Variables
	var delegate: UserDelegate?
        
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

// MARK: - Module Interface

extension UserWireframe: UserModuleInterface {
	func showDetails(user: User) {
		presenter.showDetails(user: user)
	}
}

// MARK: - Wireframe Interface

extension UserWireframe: UserPresesnterToWireframeInterface {
	
}
