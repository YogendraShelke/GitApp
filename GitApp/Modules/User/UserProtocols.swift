//
//  UserProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

// VIPER Interface for communication from Presenter -> View
protocol UserPresenterToViewInterface : class {
	func showDetails(user: User)
	func showError(error: Error)
}

// VIPER Interface for communication from Interactor -> Presenter
protocol UserInteractorToPresenterInterface : class {
	func userDetailsFetchedSuccessfully(user: User)
	func userDetailsFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol UserViewToPresenterInterface : class {
	
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol UserWireframeToPresenterInterface : class {
	func showDetails(user: User)
}

// VIPER Interface to the Module
protocol UserDelegate : class {
	
}

// Interface Abstraction for working with the VIPER Module
protocol UserModuleInterface : class {
	func showDetails(user: User)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol UserPresesnterToWireframeInterface : class {
	
}

// VIPER Interface for communication from Presenter to Interactor
protocol UserPresenterToInteractorInterface : class {
	func fetchUserDeatils(user: User)
}
