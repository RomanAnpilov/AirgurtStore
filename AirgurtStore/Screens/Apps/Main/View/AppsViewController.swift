//
//  AppsViewController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 26.06.2022.
//

import UIKit

protocol AppsViewInput: AnyObject {
    func reloadData()
}

class AppsViewController: BaseCollectionController {
    var output: AppsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifer)
        collectionView.register(AppsHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AppsHeader.identifer)
        
        collectionView.backgroundColor = .white
        output.refreshData()
//        fetchData()
    }
}

extension AppsViewController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: AppsHeader.identifer,
                                                                     for: indexPath) as! AppsHeader
        header.horizontalController.socialApps = output.headerViewModels()
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifer, for: indexPath) as! AppsGroupCell
//        let data = groups[indexPath.item]
//        cell.titleLabel.text = data.feed.title
//        cell.horizontalController.touchHandler = {data in
//            let view = AppDetailController()
//            view.appId = data.id
//            view.navigationItem.title = data.name
//            self.navigationController?.pushViewController(view, animated: true)
//        }
//        cell.horizontalController.feedResults = data.feed.results
//        cell.horizontalController.collectionView.reloadData()
        cell.backgroundColor = .red
        return cell
    }
}

extension AppsViewController: AppsViewInput {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension AppsViewController: UICollectionViewDelegateFlowLayout {
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
