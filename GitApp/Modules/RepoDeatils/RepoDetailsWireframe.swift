//
//  RepoDetailsWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class RepoDetailsWireframe: NSObject {
	
	// VIPER Module Constants
	let kRepoDetailsStoryboardIdentifier = "RepoDetails"
	let kRepoDetailsViewIdentifier = "RepoDetailsView"

	// MARK: - VIPER Stack
	lazy var moduleInteractor = RepoDetailsInteractor()
	lazy var modulePresenter = RepoDetailsPresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kRepoDetailsStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kRepoDetailsViewIdentifier) as! RepoDetailsView
	lazy var presenter : RepoDetailsWireframeToPresenterInterface = self.modulePresenter

	// MARK: - Instance Variables
	var delegate: RepoDetailsDelegate?
        
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

extension RepoDetailsWireframe: RepoDetailsModuleInterface {
	func showOptionsFor(repo: Repository) {
		presenter.showOptionsFor(repo: repo)
	}
}

// MARK: - Wireframe Interface

extension RepoDetailsWireframe: RepoDetailsPresesnterToWireframeInterface {
	func showDetails(of option: Options, for repo: Repository) {
		switch option {
		case .branches:
			let branchModule = BranchWireframe()
			moduleView.navigationController?.pushViewController(branchModule.moduleView, animated: true)
			branchModule.showBranches(repo: repo)
		case .contributors:
			let contributorModule = ContributorWireframe()
			moduleView.navigationController?.pushViewController(contributorModule.moduleView, animated: true)
			contributorModule.showContributors(repo: repo)
		case .languages:
			let languageModule = LanguageWireframe()
			moduleView.navigationController?.pushViewController(languageModule.moduleView, animated: true)
			languageModule.showLanguages(repo: repo)
		}
		let backItem = UIBarButtonItem()
		backItem.title = "Back"
		moduleView.navigationItem.backBarButtonItem = backItem
	}
}
