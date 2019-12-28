//
//  RepoDetailsView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class RepoDetailsView : UIViewController {
	
	// MARK: - VIPER Stack
	lazy var presenter : RepoDetailsViewToPresenterInterface = RepoDetailsPresenter()
        
	// MARK: - Instance Variables
	var options: [Options] = []
	var repo: Repository?

	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var watchLabel: UILabel!
	@IBOutlet weak var starsLabel: UILabel!
	@IBOutlet weak var bugLabel: UILabel!
	@IBOutlet weak var languageLabel: UILabel!
	@IBOutlet weak var forkLabel: UILabel!
	@IBOutlet weak var adminLabel: UILabel!
	
	// MARK: - Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		showActivity()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		updateView()
	}
	
	func updateView() {
		title = repo?.name
		titleLabel.text = repo?.name
		descriptionLabel.text = repo?.description
		watchLabel.text = String(describing:repo?.subscribers ?? 0)
		bugLabel.text = String(describing:repo?.openIssues ?? 0)
		forkLabel.text = String(describing:repo?.forks ?? 0)
		languageLabel.text = repo?.language
		adminLabel.text = repo?.owner?.username
		starsLabel.text = String(describing:repo?.stars ?? 0)
		tableView.reloadData()
	}
}

// MARK: - TableView DataSource
extension RepoDetailsView: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "RepoDetailsCell", for: indexPath)
		cell.textLabel?.text = options[indexPath.row].rawValue
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return options.count
	}
}

// MARK: - TableView Delegate

extension RepoDetailsView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let repo = repo {
			presenter.selected(option: options[indexPath.row], for: repo)
		}
	}
}

// MARK: - View Interface

extension RepoDetailsView: RepoDetailsPresenterToViewInterface {
	func showOptions(repo: Repository) {
		self.repo = repo
		options = [.contributors, .branches]
		if isViewLoaded {
			updateView()
		}
	}
	
	func showError(error: Error) {
		showToast(message: error.localizedDescription)
	}
	
	func showRepoDetails(repo: Repository) {
		self.repo = repo
		hideActivity()
		updateView()
	}
}
