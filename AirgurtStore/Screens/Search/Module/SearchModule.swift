//
//  SearchModule.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 25.06.2022.
//

import Foundation

class SearchModule {
    let viewController: SearchViewController
    
    private let presenter: SearchPresenter
    
    init() {
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        viewController.output = presenter
        presenter.view = viewController
        
        self.viewController = viewController
        self.presenter = presenter
    }
}
