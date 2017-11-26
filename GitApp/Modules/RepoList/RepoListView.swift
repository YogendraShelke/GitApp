//
//  RepoListView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/09/17.
//  Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class RepoListView : UIViewController {
	
	// MARK: - VIPER Stack
	lazy var presenter : RepoListViewToPresenterInterface = RepoListPresenter()
	
	// MARK: - Instance Variables
	var repoList: [Repository] = []
	var spinner: MBProgressHUD!

	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - View Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		title = "Home"
		presenter.getPublicRepos()
		showActivityIndicator()
	}
	
	func showActivityIndicator() {
		spinner = MBProgressHUD.showAdded(to: view, animated: true)
		spinner.margin = 20
		spinner.bezelView.color = .black
		spinner.contentColor = .white
	}
}

// MARK: - TableView DataSource
extension RepoListView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RepoListCell", for: indexPath) as! RepoCell
		let repo = repoList[indexPath.row]
		cell.title?.text = repo.name
		cell.desc.text = repo.desc
		if let imageUrl = repo.owner?.profilePicUrl {
			cell.avatar.sd_setImage(with: URL(string: imageUrl), completed: nil)
		}
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
		spinner.hide(animated: true)
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

