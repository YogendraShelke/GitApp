//
//  BranchProtocols.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

// VIPER Interface for communication from Presenter -> View
protocol BranchPresenterToViewInterface : class {
	func showBranchList(branchList: [Branch])
	func showError(error: Error)
}

// VIPER Interface for communication from Presenter to Interactor
protocol BranchPresenterToInteractorInterface : class {
	func getBranches(repo: Repository)
}

// VIPER Interface for communication from Interactor -> Presenter
protocol BranchInteractorToPresenterInterface : class {
	func branchesFetchedSuccessfully(branchList: [Branch])
	func branchesFetchOperationFailed(error: Error)
}

// VIPER Interface for communication from View -> Presenter
protocol BranchViewToPresenterInterface : class {
	
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol BranchWireframeToPresenterInterface : class {
	func showBranches(repo: Repository)
}

// VIPER Interface to the Module
protocol BranchDelegate : class {
	
}

// Interface Abstraction for working with the VIPER Module
protocol BranchModuleInterface : class {
	func showBranches(repo: Repository)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol BranchPresesnterToWireframeInterface : class {
	
}
