//
//  LanguageView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 30/09/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit
import MBProgressHUD

class LanguageView : UIViewController {
	// MARK: - VIPER Stack
	lazy var presenter : LanguageViewToPresenterInterface = LanguagePresenter()
        
	// MARK: - Instance Variables
	var repo: Repository?
	var languages: [Language] = []
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

extension LanguageView: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
		cell.textLabel?.text = languages[indexPath.row].name
		if let numberOfLines = languages[indexPath.row].value {
			cell.detailTextLabel?.text = "Number of lines : " + String(describing: numberOfLines)
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return languages.count
	}
}

// MARK: - TableView Delegate

extension LanguageView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	}
}

// MARK: - View Interface

extension LanguageView: LanguagePresenterToViewInterface {
	func showLanguageList(languages: [Language]) {
		self.languages = languages
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
