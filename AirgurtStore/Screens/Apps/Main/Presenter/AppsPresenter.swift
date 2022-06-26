//
//  AppsPresenter.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 26.06.2022.
//

import Foundation

protocol AppsViewOutput {
    func refreshData()
    func headerViewModels() -> [AppsHeaderCellViewModel]
}

class AppsPresenter {
    
    weak var view: AppsViewInput?
//    private var groups = [AppGroup]()
    private var appsHeaderViewModels = [AppsHeaderCellViewModel]()
    private let networkManager = NetworkManager.shared
    
    private func fetchData() {
//        var group1: AppGroup?
//        var group2: AppGroup?
//        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
//        dispatchGroup.enter()
//        networkManager.fetchAppGroup(typeResponse: .mostPlayed){result in
//            switch result {
//            case .success(let result):
//                group1 = result
//            case .failure(let error):
//                debugPrint(error)
//            }
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        networkManager.fetchAppGroup(typeResponse: .topFree){result in
//            switch result {
//            case .success(let result):
//                group2 = result
//            case .failure(let error):
//                debugPrint(error)
//            }
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        networkManager.fetchAppGroup(typeResponse: .topPaid){result in
//            switch result {
//            case .success(let result):
//                group3 = result
//            case .failure(let error):
//                debugPrint(error)
//            }
//            dispatchGroup.leave()
//        }
        
        dispatchGroup.enter()
        networkManager.fetchSocialApp{result in
            switch result {
            case .success(let result):
                self.appsHeaderViewModels = result.map{AppsHeaderCellViewModel(dataModel: $0)}
            case .failure(let error):
                debugPrint(error)
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
//            if let group = group1 {
//                self.groups.append(group)
//            }
//            if let group = group2 {
//                self.groups.append(group)
//            }
//            if let group = group3 {
//                self.groups.append(group)
//            }
            self.view?.reloadData()
        }
    }
}

extension AppsPresenter: AppsViewOutput {
    func headerViewModels() -> [AppsHeaderCellViewModel] {
        return appsHeaderViewModels
    }
    
    func refreshData() {
        fetchData()
    }
}
