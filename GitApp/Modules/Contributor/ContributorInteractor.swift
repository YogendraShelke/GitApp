//
//  ContributorInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class ContributorInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : ContributorInteractorToPresenterInterface = ContributorPresenter()        
}

// MARK: - Interactor Interface

extension ContributorInteractor: ContributorPresenterToInteractorInterface {
	func getContributors(repo: Repository) {
		
		RepoService.shared.getContributors(repo: repo) { [weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let contributors):
					self?.presenter.contributorFetchedSuccessfully(contributors: contributors)
				case .failure(let error):
					self?.presenter.contributorFetchOperationFailed(error: error)
				}
			}
		}
	}
}
