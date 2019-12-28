//
//  RepoListInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class RepoListInteractor {
	// MARK: - VIPER Stack
	lazy var presenter : RepoListInteractorToPresenterInterface = RepoListPresenter()
}

// MARK: - Interactor Interface

extension RepoListInteractor: RepoListPresenterToInteractorInterface {
	
	func getPublicRepos() {
		RepoService.shared.getPublicRepos {[weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let repoList):
					self?.presenter.reposFetchedSuccessfully(repoList: repoList)
				case .failure(let error):
					self?.presenter.repoFetchOperationFailed(error: error)
				}
			}
		}
	}
}
