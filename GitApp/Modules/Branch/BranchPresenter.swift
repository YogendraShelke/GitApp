//
//  BranchPresenter.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import Foundation

class BranchPresenter : NSObject {
	// MARK: - VIPER Stack
	lazy var interactor : BranchPresenterToInteractorInterface = BranchInteractor()
	lazy var view : BranchPresenterToViewInterface = BranchView()
	lazy var wireframe : BranchPresesnterToWireframeInterface = BranchWireframe()
}
	
// MARK: - Presenter Interface

extension BranchPresenter: BranchInteractorToPresenterInterface {
	func branchesFetchedSuccessfully(branchList: [Branch]) {
		view.showBranchList(branchList: branchList)
	}
	
	func branchesFetchOperationFailed(error: Error) {
		view.showError(error: error)
	}
}

extension BranchPresenter: BranchViewToPresenterInterface {
	
}

extension BranchPresenter: BranchWireframeToPresenterInterface {
	func showBranches(repo: Repository) {
		interactor.getBranches(repo: repo)
	}
}
