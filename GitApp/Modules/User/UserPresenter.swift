//
//  UserPresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class UserPresenter : NSObject {
	// MARK: - VIPER Stack
	lazy var interactor : UserPresenterToInteractorInterface = UserInteractor()
	lazy var view : UserPresenterToViewInterface = UserView()
	lazy var wireframe : UserPresesnterToWireframeInterface = UserWireframe()
}

// MARK: - Presenter Interface

extension UserPresenter: UserInteractorToPresenterInterface {
	func userDetailsFetchedSuccessfully(user: User) {
		view.showDetails(user: user)
	}
	
	func userDetailsFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}

extension UserPresenter: UserViewToPresenterInterface {
	
}

extension UserPresenter: UserWireframeToPresenterInterface {
	func showDetails(user: User) {
		interactor.fetchUserDeatils(user: user)
	}
}

