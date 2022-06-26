//
//  AppsHorizontalController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController {
    var feedResults = [FeedResult]()
    private let topBottomPadding: CGFloat = 12
    private let lineSpacing: CGFloat = 10
    var touchHandler: ((FeedResult) -> ())?
    
    private let cellIdentifer = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: cellIdentifer)
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = feedResults[indexPath.item]
        touchHandler?(data)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! AppsRowCell
        cell.feedResult = feedResults[indexPath.item]
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - topBottomPadding * 2 - lineSpacing * 2) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}
