//
//  RepoListView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class RepoListView : UIViewController {
	
	// MARK: - VIPER Stack
	lazy var presenter : RepoListViewToPresenterInterface = RepoListPresenter()
	
	// MARK: - Instance Variables
	var repoList: [Repository] = []

	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - View Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		title = "Home"
		presenter.getPublicRepos()
		showActivity()
	}
}

// MARK: - TableView DataSource
extension RepoListView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RepoListCell", for: indexPath) as! RepoCell
		let repo = repoList[indexPath.row]
		cell.configure(title: repo.name, desc: repo.description, imageUrl: repo.owner?.avatar)
		return cell
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return repoList.count
	}
}

// MARK: - TableView Delegate

extension RepoListView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.selected(repo: repoList[indexPath.row])
	}
}

// MARK: - View Interface

extension RepoListView: RepoListPresenterToViewInterface {
	func showRepoList(repoList: [Repository]) {
		self.repoList = repoList
		tableView.reloadData()
		hideActivity()
	}
	
	func showError(error: Error) {
		showToast(message: error.localizedDescription)
	}
}

