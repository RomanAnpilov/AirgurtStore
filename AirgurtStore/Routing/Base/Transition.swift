//
//  Transition.swift
//
//  Created by Роман Анпилов
//

import Foundation
import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? {get set}
    
    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
