//
//  ContributorPresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class ContributorPresenter : NSObject {
	// MARK: - VIPER Stack
	lazy var interactor : ContributorPresenterToInteractorInterface = ContributorInteractor()
	lazy var view : ContributorPresenterToViewInterface = ContributorView()
	lazy var wireframe : ContributorPresesnterToWireframeInterface = ContributorWireframe()
}

// MARK: - Presenter Interface

extension ContributorPresenter: ContributorInteractorToPresenterInterface {
	func contributorFetchedSuccessfully(contributors: [User]) {
		view.showContributorList(contributors: contributors)
	}
	
	func contributorFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}

extension ContributorPresenter: ContributorViewToPresenterInterface {
	func selected(user: User) {
		wireframe.showDetails(user: user)
	}
}

extension ContributorPresenter: ContributorWireframeToPresenterInterface {
	func showContributors(repo: Repository) {
		interactor.getContributors(repo: repo)
	}
}
