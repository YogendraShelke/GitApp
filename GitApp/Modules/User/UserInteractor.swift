//
//  UserInteractor.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class UserInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter : UserInteractorToPresenterInterface = UserPresenter()
}

// MARK: - Interactor Interface

extension UserInteractor: UserPresenterToInteractorInterface {
	func fetchUserDeatils(user: User) {
		UserService.shared.getUserDetails(user: user) {[weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let userDetails):
					self?.presenter.userDetailsFetchedSuccessfully(user: userDetails)
				case .failure(let error):
					self?.presenter.userDetailsFetchOperationFailed(error: error)
				}
			}
		}
	}
}
