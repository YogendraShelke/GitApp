//
//  RepoListInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RepoListInteractor {
	// MARK: - VIPER Stack
	lazy var presenter : RepoListInteractorToPresenterInterface = RepoListPresenter()
}

// MARK: - Interactor Interface

extension RepoListInteractor: RepoListPresenterToInteractorInterface {
	
	func getPublicRepos() {
		Alamofire.request(Router.getPublicRepos).validate().responseJSON { response in
			switch response.result {
			case .success:
				var repoList: [Repository] = []
				if let objectList = response.result.value as? [Any] {
					for json in objectList {
						repoList.append(Repository(json: JSON(json)))
					}
				}
				repoList.sort{ $0.name! < $1.name! }
				self.presenter.reposFetchedSuccessfully(repoList: repoList)
			case .failure(let error):
				self.presenter.repoFetchOperationFailed(error: error)
			}
		}
	}
}
