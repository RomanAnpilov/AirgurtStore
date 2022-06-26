//
//  AppsController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

class AppsController: BaseCollectionController {
    private var socialApps = [SocialApp]()
    private var groups = [AppGroup]()
    private var editorsChoiseGame: AppGroup?
    private let networkManager = NetworkManager.shared
    private let headerIdentifer = "header"
    private let cellIdentifer = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellIdentifer)
        collectionView.register(AppsHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifer)
        
        collectionView.backgroundColor = .white
        fetchData()
    }
    
    private func fetchData() {
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        networkManager.fetchAppGroup(typeResponse: .mostPlayed){result in
            switch result {
            case .success(let result):
                group1 = result
            case .failure(let error):
                debugPrint(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchAppGroup(typeResponse: .topFree){result in
            switch result {
            case .success(let result):
                group2 = result
            case .failure(let error):
                debugPrint(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchAppGroup(typeResponse: .topPaid){result in
            switch result {
            case .success(let result):
                group3 = result
            case .failure(let error):
                debugPrint(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchSocialApp{result in
            switch result {
            case .success(let result):
                self.socialApps = result
            case .failure(let error):
                debugPrint(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    // Header View
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifer, for: indexPath) as! AppsHeader
//        header.horizontalController.socialApps = socialApps
//        header.horizontalController.collectionView.reloadData()
//        return header
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! AppsGroupCell
        let data = groups[indexPath.item]
        cell.titleLabel.text = data.feed.title
        cell.horizontalController.touchHandler = {data in
            let view = AppDetailController()
            view.appId = data.id
            view.navigationItem.title = data.name
            self.navigationController?.pushViewController(view, animated: true)
        }
        cell.horizontalController.feedResults = data.feed.results
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
}

extension AppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    // Header Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
