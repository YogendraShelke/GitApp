//
//  RepoDetailsInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RepoDetailsInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : RepoDetailsInteractorToPresenterInterface = RepoDetailsPresenter()
}

// MARK: - Interactor Interface

extension RepoDetailsInteractor: RepoDetailsPresenterToInteractorInterface {
	func getRepoDetails(repo: Repository) {
		guard let owner = repo.owner?.userName, let repoName = repo.name else { return }
		Alamofire.request(Router.getRepoDetails(owner: owner, repoName: repoName)).validate().responseJSON { response in
			switch response.result {
			case .success:
				let repository = Repository(json: JSON(response.result.value as Any))
				self.presenter.repoDetailsFetchedSuccessfully(repo: repository)
			case .failure(let error):
				self.presenter.repoDetailsFetchOperationFailed(error: error)
			}
		}
	}
}
