//
//  ModuleBuilder.swift
//  SnapkitTest
//
//  Created by Alex on 16.08.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createSettingsModule() -> UIViewController {
        return UIViewController()
    }
    
    static func createInformationModule() -> UIViewController {
        return UIViewController()
    }
}
