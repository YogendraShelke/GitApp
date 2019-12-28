//
//  BranchView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class BranchView : UIViewController {
	// MARK: - VIPER Stack
	lazy var presenter : BranchViewToPresenterInterface = BranchPresenter()
        
	// MARK: - Instance Variables
	var repo: Repository?
	var branches: [Branch] = []
	
	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
        
	// MARK: - Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		showActivity()
		tableView.tableFooterView = UIView()
	}
}

// MARK: - TableView DataSource

extension BranchView: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath)
		cell.textLabel?.text = branches[indexPath.row].name
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return branches.count
	}
}

// MARK: - Wireframe Interface

extension BranchView: BranchPresenterToViewInterface {
	func showBranchList(branchList: [Branch]) {
		branches = branchList
		hideActivity()
		tableView.reloadData()
	}
	
	func showError(error: Error) {
		showToast(message: error.localizedDescription)
	}
}
