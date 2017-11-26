//
//  RepoDetailsPresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class RepoDetailsPresenter : NSObject {
	// MARK: - VIPER Stack
	lazy var interactor : RepoDetailsPresenterToInteractorInterface = RepoDetailsInteractor()
	lazy var view : RepoDetailsPresenterToViewInterface = RepoDetailsView()
	lazy var wireframe : RepoDetailsPresesnterToWireframeInterface = RepoDetailsWireframe()
}

// MARK: - Presenter Interface

extension RepoDetailsPresenter: RepoDetailsInteractorToPresenterInterface {
	func repoDetailsFetchedSuccessfully(repo: Repository) {
		view.showRepoDetails(repo: repo)
	}
	
	func repoDetailsFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}

extension RepoDetailsPresenter: RepoDetailsWireframeToPresenterInterface {
	func showOptionsFor(repo: Repository) {
		view.showOptions(repo: repo)
		interactor.getRepoDetails(repo: repo)
	}
}

extension RepoDetailsPresenter: RepoDetailsViewToPresenterInterface {
	func selected(option: Options, for repo: Repository) {
		wireframe.showDetails(of: option, for: repo)
	}
}
