//
//  UserView.swift
//  GitApp
//
//  Created by Yogendra Shelke on 01/10/17.
//	Copyright © 2017 Yogendra Shelke. All rights reserved.
//

import UIKit

class UserView : UIViewController {
	
	// MARK: - VIPER Stack
	lazy var presenter : UserViewToPresenterInterface = UserPresenter()
        
	// MARK: - Instance Variables
	var userStats: [(key: String, value: String)] = []

	// MARK: - Outlets
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var company: UILabel!
	@IBOutlet weak var location: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
        
	// MARK: - Operational
	override func viewDidLoad() {
		super.viewDidLoad()
		profileImage.layer.cornerRadius = profileImage.frame.size.width/2
		profileImage.layer.borderWidth = 4
		profileImage.layer.borderColor = UIColor.white.cgColor
		profileImage.clipsToBounds = true
		showActivity()
	}
	
	func updateView(user: User) {
		name.text = user.name
		company.text = user.company
		location.text = user.location
		if let imageUrl = user.avatar, let url = URL(string: imageUrl) {
			profileImage.load(url: url)
		}
		if let publicRepos = user.publicRepos {
			userStats.append((key: "Public Repositories", value: "\(publicRepos)"))
		}
		if let publicGists = user.publicGists {
			userStats.append((key: "Public Gists", value: "\(publicGists)"))
		}
		if let followers = user.followers {
			userStats.append((key: "Followers", value: "\(followers)"))
		}
		if let following = user.following {
			userStats.append((key: "Following", value: "\(following)"))
		}
		collectionView.reloadData()
	}
}

// MARK: - CollectionView DataSource

extension UserView: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return userStats.count
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserStatsCell
		cell.title.text = userStats[indexPath.row].value
		cell.desc.text = userStats[indexPath.row].key
		return cell
	}
}

extension UserView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = view.frame.size.width/2
		return CGSize(width: width, height: 90)
	}
}

// MARK: - View Interface

extension UserView: UserPresenterToViewInterface {
	func showDetails(user: User) {
		hideActivity()
		updateView(user: user)
	}
	
	func showError(error: Error) {
		showToast(message: error.localizedDescription)
	}
}
