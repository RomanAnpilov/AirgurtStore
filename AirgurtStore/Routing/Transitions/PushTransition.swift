//
//  PushTransition.swift
//
//  Created by Роман Анпилов
//

import UIKit

class PushTransition {
    weak var viewController: UIViewController?
}

extension PushTransition: Transition {
    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }

    func close(_ viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}

extension UINavigationController {
    func remove(type: AnyClass) {
        for vc in viewControllers where vc.isKind(of: type) {
            vc.removeFromParent()
        }
    }
}
