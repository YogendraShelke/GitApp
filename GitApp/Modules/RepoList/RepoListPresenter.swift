//
//  RepoListPresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class RepoListPresenter {
	
	// MARK: - VIPER Stack
	lazy var interactor : RepoListPresenterToInteractorInterface = RepoListInteractor()
	lazy var view : RepoListPresenterToViewInterface = RepoListView()
	lazy var wireframe : RepoListPresesnterToWireframeInterface = RepoListWireframe()
}

// MARK: - Presenter Interface

extension RepoListPresenter : RepoListWireframeToPresenterInterface {
}

extension RepoListPresenter : RepoListViewToPresenterInterface {
	func selected(repo: Repository) {
		wireframe.showDetailsScreenFor(repo: repo)
	}
	
	func getPublicRepos() {
		interactor.getPublicRepos()
	}
}

extension RepoListPresenter : RepoListInteractorToPresenterInterface {
	func reposFetchedSuccessfully(repoList: [Repository]) {
		view.showRepoList(repoList: repoList)
	}
	
	func repoFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}


