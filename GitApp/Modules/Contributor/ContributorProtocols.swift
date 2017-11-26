//
//  ContributorProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

// VIPER Interface for communication from Presenter -> View
protocol ContributorPresenterToViewInterface : class {
	func showContributorList(contributors: [User])
	func showError(error: Error)
}

// VIPER Interface for communication from Presenter to Interactor
protocol ContributorPresenterToInteractorInterface : class {
	func getContributors(repo: Repository)
}

// VIPER Interface for communication from Interactor -> Presenter
protocol ContributorInteractorToPresenterInterface : class {
	func contributorFetchedSuccessfully(contributors: [User])
	func contributorFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol ContributorViewToPresenterInterface : class {
	func selected(user: User)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol ContributorWireframeToPresenterInterface : class {
	func showContributors(repo: Repository)
}

// VIPER Interface to the Module
protocol ContributorDelegate : class {
	
}

// Interface Abstraction for working with the VIPER Module
protocol ContributorModuleInterface : class {
	func showContributors(repo: Repository)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol ContributorPresesnterToWireframeInterface : class {
	func showDetails(user: User)
}
