//
//  RepoDetailsProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

// VIPER Interface for communication from Interactor -> Presenter
protocol RepoDetailsInteractorToPresenterInterface : class {
	func repoDetailsFetchedSuccessfully(repo: Repository)
	func repoDetailsFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol RepoDetailsViewToPresenterInterface : class {
	func selected(option: Options, for repo: Repository)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol RepoDetailsWireframeToPresenterInterface : class {
	func showOptionsFor(repo: Repository)
}

// VIPER Interface for communication from Presenter to Interactor
protocol RepoDetailsPresenterToInteractorInterface : class {
	func getRepoDetails(repo: Repository)
}

// VIPER Interface for communication from Presenter -> View
protocol RepoDetailsPresenterToViewInterface : class {
	func showRepoDetails(repo: Repository)
	func showOptions(repo: Repository)
	func showError(error: Error)
}

// VIPER Interface to the Module
protocol RepoDetailsDelegate : class {
}

// Interface Abstraction for working with the VIPER Module
protocol RepoDetailsModuleInterface : class {
	func showOptionsFor(repo: Repository)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol RepoDetailsPresesnterToWireframeInterface : class {
	func showDetails(of option: Options, for repo: Repository)
}

