//
//  LanguageInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LanguageInteractor: NSObject {
	// MARK: - VIPER Stack
	lazy var presenter : LanguageInteractorToPresenterInterface = LanguagePresenter()
}

// MARK: - Interactor Interface

extension LanguageInteractor: LanguagePresenterToInteractorInterface {
	func getLanguages(repo: Repository) {
		guard let owner = repo.owner?.userName, let repoName = repo.name else { return }
		Alamofire.request(Router.getLanguages(owner: owner, repoName: repoName)).validate().responseJSON { response in
			switch response.result {
			case .success:
				let languageList = Language.initWithObject(object: JSON(response.result.value as Any))
				self.presenter.languagesFetchedSuccessfully(languageList: languageList)
			case .failure(let error):
				self.presenter.languagesFetchOperationFailed(error: error)
			}
		}
	}
}
