//
//  SearchPresenter.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import Foundation

protocol SearchViewOutput {
    func didChangeSearch(appTerm: String)
    func cellViewModel(for indexPath: IndexPath) -> SearchCellViewModel
    func numberOfSections() -> Int
}

class SearchPresenter {
    private let networkManager = NetworkManager.shared
    weak var view: SearchViewInput?
    
    private var viewModels = [SearchCellViewModel]()
    
    private func fetchData(appTerm: String) {
        networkManager.fetchApps(appTerm: appTerm) { result in
            switch result {
            case .success(let data):
                self.viewModels = data.results.map{ SearchCellViewModel(dataModel: $0) }
                self.view?.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

extension SearchPresenter: SearchViewOutput {
    func numberOfSections() -> Int {
        viewModels.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> SearchCellViewModel {
        return viewModels[indexPath.item]
    }
    
    func didChangeSearch(appTerm: String) {
        fetchData(appTerm: appTerm)
    }
}
