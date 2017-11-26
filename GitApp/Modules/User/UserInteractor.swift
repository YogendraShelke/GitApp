//
//  UserInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : UserInteractorToPresenterInterface = UserPresenter()
}

// MARK: - Interactor Interface

extension UserInteractor: UserPresenterToInteractorInterface {
	func fetchUserDeatils(user: User) {
		guard let userName = user.userName else { return }
		Alamofire.request(Router.getUserDetails(user: userName)).validate().responseJSON { response in
			switch response.result {
			case .success:
				let userDetails = User(json: JSON(response.result.value as Any))
				self.presenter.userDetailsFetchedSuccessfully(user: userDetails)
			case .failure(let error):
				self.presenter.userDetailsFetchOperationFailed(error: error)
			}
		}
	}
}
