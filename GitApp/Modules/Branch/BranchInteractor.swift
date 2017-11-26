//
//  BranchInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BranchInteractor: NSObject {
	// MARK: - VIPER Stack
	lazy var presenter : BranchInteractorToPresenterInterface = BranchPresenter()
}

// MARK: - Interactor Interface

extension BranchInteractor: BranchPresenterToInteractorInterface {
	func getBranches(repo: Repository) {
		guard let owner = repo.owner?.userName, let repoName = repo.name else { return }
		Alamofire.request(Router.getBranches(owner: owner, repoName: repoName)).validate().responseJSON { response in
			switch response.result {
			case .success:
				var branchList: [Branch] = []
				if let objectList = response.result.value as? [Any] {
					for json in objectList {
						branchList.append(Branch(json: JSON(json)))
					}
				}
				self.presenter.branchesFetchedSuccessfully(branchList: branchList)

			case .failure(let error):
				self.presenter.branchesFetchOperationFailed(error: error)
			}
		}
	}
}
