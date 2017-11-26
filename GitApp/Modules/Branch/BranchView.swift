//
//  BranchView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import MBProgressHUD

class BranchView : UIViewController {
	// MARK: - VIPER Stack
	lazy var presenter : BranchViewToPresenterInterface = BranchPresenter()
        
	// MARK: - Instance Variables
	var repo: Repository?
	var branches: [Branch] = []
	var spinner: MBProgressHUD!
	
	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
        
	// MARK: - Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		showActivityIndicator()
		tableView.tableFooterView = UIView()
	}
	
	func showActivityIndicator() {
		spinner = MBProgressHUD.showAdded(to: view, animated: true)
		spinner.margin = 20
		spinner.bezelView.color = .black
		spinner.contentColor = .white
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
		spinner.hide(animated: true)
		tableView.reloadData()
	}
	
	func showError(error: Error) {
		spinner.mode = .text
		spinner.detailsLabel.text = error.localizedDescription
		spinner.removeFromSuperViewOnHide = true
		spinner.margin = 20
		spinner.bezelView.color = .black
		spinner.contentColor = .white
		spinner.hide(animated: true, afterDelay: 3)
	}
}
