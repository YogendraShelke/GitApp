//
//  RepoListProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

// VIPER Interface for communication from Interactor -> Presenter
protocol RepoListInteractorToPresenterInterface : class {
	func reposFetchedSuccessfully(repoList: [Repository])
	func repoFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol RepoListViewToPresenterInterface : class {
	func getPublicRepos()
	func selected(repo: Repository)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol RepoListWireframeToPresenterInterface : class {
	
}

// VIPER Interface for communication from Presenter to Interactor
protocol RepoListPresenterToInteractorInterface : class {
	func getPublicRepos()
}

// VIPER Interface for communication from Presenter -> View
protocol RepoListPresenterToViewInterface : class {
	func showRepoList(repoList: [Repository])
	func showError(error: Error)
}

// VIPER Interface to the Module
protocol RepoListDelegate : class {
}

// Interface Abstraction for working with the VIPER Module
protocol RepoListModuleInterface : class {
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol RepoListPresesnterToWireframeInterface : class {
	func showDetailsScreenFor(repo: Repository)
}
