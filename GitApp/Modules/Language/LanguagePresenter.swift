//
//  LanguagePresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class LanguagePresenter : NSObject {
	// MARK: - VIPER Stack
	lazy var interactor : LanguagePresenterToInteractorInterface = LanguageInteractor()
	lazy var view : LanguagePresenterToViewInterface = LanguageView()
	lazy var wireframe : LanguagePresesnterToWireframeInterface = LanguageWireframe()
}

// MARK: - Presenter Interface

extension LanguagePresenter: LanguageInteractorToPresenterInterface {
	func languagesFetchedSuccessfully(languageList: [Language]) {
		view.showLanguageList(languages: languageList)
	}
	
	func languagesFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}

extension LanguagePresenter: LanguageViewToPresenterInterface {
	
}

extension LanguagePresenter: LanguageWireframeToPresenterInterface {
	func showLanguages(repo: Repository) {
		interactor.getLanguages(repo: repo)
	}
}
