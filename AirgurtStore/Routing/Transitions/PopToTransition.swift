//
//  PopToTransition.swift
//
//  Created by Роман Анпилов
//

import UIKit

class PopToTransition {
    weak var viewController: UIViewController?
    
    func popToRoot() {
        self.viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func popTo(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popToViewController(viewController, animated: true)
    }
}
