//
//  RepoDetailsInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class RepoDetailsInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : RepoDetailsInteractorToPresenterInterface = RepoDetailsPresenter()
}

// MARK: - Interactor Interface

extension RepoDetailsInteractor: RepoDetailsPresenterToInteractorInterface {
	func getRepoDetails(repo: Repository) {
		
		RepoService.shared.getRepoDetails(repo: repo) { [weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let repository):
					self?.presenter.repoDetailsFetchedSuccessfully(repo: repository)
				case .failure(let error):
					self?.presenter.repoDetailsFetchOperationFailed(error: error)
				}
			}
		}
	}
}
