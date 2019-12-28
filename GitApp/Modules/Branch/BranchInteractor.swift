//
//  BranchInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class BranchInteractor: NSObject {
	// MARK: - VIPER Stack
	lazy var presenter : BranchInteractorToPresenterInterface = BranchPresenter()
}

// MARK: - Interactor Interface

extension BranchInteractor: BranchPresenterToInteractorInterface {
	func getBranches(repo: Repository) {
		
		RepoService.shared.getBranches(repo: repo) { [weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let branchList):
					self?.presenter.branchesFetchedSuccessfully(branchList: branchList)
				case .failure(let error):
					self?.presenter.branchesFetchOperationFailed(error: error)
				}
			}
		}
	}
}
