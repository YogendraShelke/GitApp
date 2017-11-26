//
//  RepoListWireframe.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit


class RepoListWireframe: NSObject {
	
	// VIPER Module Constants
	let kRepoListStoryboardIdentifier = "RepoList"
	let kRepoListViewIdentifier = "RepoListView"

	// MARK: - VIPER Stack
	lazy var moduleInteractor = RepoListInteractor()
	lazy var modulePresenter = RepoListPresenter()
	lazy var storyboard : UIStoryboard = UIStoryboard(name: kRepoListStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kRepoListViewIdentifier) as! RepoListView
	lazy var presenter : RepoListWireframeToPresenterInterface = self.modulePresenter

	// MARK: - Instance Variables
	var delegate: RepoListDelegate?
	
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

extension RepoListWireframe : RepoListPresesnterToWireframeInterface {
	func showDetailsScreenFor(repo: Repository) {
		let repoDetails = RepoDetailsWireframe()
		moduleView.navigationController!.pushViewController(repoDetails.moduleView, animated: true)
		repoDetails.showOptionsFor(repo: repo)
	}
}

// MARK: - Module Interface

extension RepoListWireframe : RepoListModuleInterface {
	
}


