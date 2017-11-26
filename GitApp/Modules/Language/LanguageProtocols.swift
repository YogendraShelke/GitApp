//
//  LanguageProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

// VIPER Interface for communication from Presenter -> View
protocol LanguagePresenterToViewInterface : class {
	func showLanguageList(languages: [Language])
	func showError(error: Error)
}

// VIPER Interface for communication from Presenter to Interactor
protocol LanguagePresenterToInteractorInterface : class {
	func getLanguages(repo: Repository)
}

// VIPER Interface for communication from Interactor -> Presenter
protocol LanguageInteractorToPresenterInterface : class {
	func languagesFetchedSuccessfully(languageList: [Language])
	func languagesFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol LanguageViewToPresenterInterface : class {
	
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol LanguageWireframeToPresenterInterface : class {
	func showLanguages(repo: Repository)
}

// VIPER Interface to the Module
protocol LanguageDelegate : class {
	
}

// Interface Abstraction for working with the VIPER Module
protocol LanguageModuleInterface : class {
	func showLanguages(repo: Repository)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol LanguagePresesnterToWireframeInterface : class {
	
}
