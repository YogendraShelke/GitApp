//
//  ContributorView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class ContributorView : UIViewController {
	// MARK: - VIPER Stack
	lazy var presenter : ContributorViewToPresenterInterface = ContributorPresenter()
        
	// MARK: - Instance Variables
	var repo: Repository?
	var contributors: [User] = []
	
	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		showActivity()
		tableView.tableFooterView = UIView()
		tableView.separatorColor = .init(white: 0.6, alpha: 1)
	}
}

// MARK: - TableView DataSource
extension ContributorView: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContributorCell", for: indexPath) as! RepoCell
		let contributor = contributors[indexPath.row]
		cell.configure(title: contributor.username, desc: nil, imageUrl: contributor.avatar)
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contributors.count
	}
}

// MARK: - TableView Delegate
extension ContributorView: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.selected(user: contributors[indexPath.row])
	}
}

// MARK: - View Interface
extension ContributorView: ContributorPresenterToViewInterface {
	
	func showContributorList(contributors: [User]) {
		self.contributors = contributors
		hideActivity()
		tableView.reloadData()
	}
	
	func showError(error: Error) {
		showToast(message: error.localizedDescription)
	}
}
