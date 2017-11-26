//
//  ContributorView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import MBProgressHUD

class ContributorView : UIViewController {
	// MARK: - VIPER Stack
	lazy var presenter : ContributorViewToPresenterInterface = ContributorPresenter()
        
	// MARK: - Instance Variables
	var repo: Repository?
	var contributors: [User] = []
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
extension ContributorView: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContributorCell", for: indexPath) as! RepoCell
		let contributor = contributors[indexPath.row]
		cell.title?.text = contributor.userName
		if let imageUrl = contributor.profilePicUrl {
			cell.avatar.sd_setImage(with: URL(string: imageUrl), completed: nil)
		}

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
