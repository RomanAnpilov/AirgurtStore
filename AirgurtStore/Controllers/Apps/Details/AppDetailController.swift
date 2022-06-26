//
//  AppDetailController.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import UIKit

class AppDetailController: BaseCollectionController {
    private let networkManager = NetworkManager.shared
    
    var appId: String! {
        didSet {
//            networkManager.fetchAppData(appId: appId) { result in
//                switch result {
//                case .success(let result):
//                    print(result.results.first?.description)
//                case .failure(let error):
//                    debugPrint(error)
//                }
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsDetailsCell.self, forCellWithReuseIdentifier: AppsDetailsCell.identifer)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsDetailsCell.identifer, for: indexPath)
        return cell
    }
}

extension AppDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
}
