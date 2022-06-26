//
//  AppsModule.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 26.06.2022.
//

import Foundation

class AppsModule {
    let viewController: AppsViewController
    
    private let presenter: AppsPresenter
    
    init() {
        let viewController = AppsViewController()
        let presenter = AppsPresenter()
        viewController.output = presenter
        presenter.view = viewController
        
        self.viewController = viewController
        self.presenter = presenter
    }
}
