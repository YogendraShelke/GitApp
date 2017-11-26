//
//  ContributorInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ContributorInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : ContributorInteractorToPresenterInterface = ContributorPresenter()        
}

// MARK: - Interactor Interface

extension ContributorInteractor: ContributorPresenterToInteractorInterface {
	func getContributors(repo: Repository) {
		guard let owner = repo.owner?.userName, let repoName = repo.name else { return }
		Alamofire.request(Router.getContributors(owner: owner, repoName: repoName)).validate().responseJSON { response in
			switch response.result {
			case .success:
				var contributorList: [User] = []
				if let objectList = response.result.value as? [Any] {
					for json in objectList {
						contributorList.append(User(json: JSON(json)))
					}
				}
				self.presenter.contributorFetchedSuccessfully(contributors: contributorList)

			case .failure(let error):
				self.presenter.contributorFetchOperationFailed(error: error)
			}
		}
	}

}
