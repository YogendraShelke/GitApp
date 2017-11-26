//
//  LanguageWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class LanguageWireframe: NSObject {
	
	// VIPER Module Constants
	let kLanguageStoryboardIdentifier = "Language"
	let kLanguageViewIdentifier = "LanguageView"
	
	
	// MARK: - VIPER Stack
	lazy var moduleInteractor = LanguageInteractor()
	lazy var modulePresenter = LanguagePresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kLanguageStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kLanguageViewIdentifier) as! LanguageView
	lazy var presenter : LanguageWireframeToPresenterInterface = self.modulePresenter
	
	// MARK: - Instance Variables
	var delegate: LanguageDelegate?
	
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

extension LanguageWireframe: LanguagePresesnterToWireframeInterface {
	
}

// MARK: - Module Interface

extension LanguageWireframe: LanguageModuleInterface {
	func showLanguages(repo: Repository) {
		presenter.showLanguages(repo: repo)
	}
}
