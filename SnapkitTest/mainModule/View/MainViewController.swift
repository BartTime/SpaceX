//
//  ViewController.swift
//  SnapkitTest
//
//  Created by Alex on 29.07.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var pageController: UIPageViewController!
    private var controllers = [UIViewController]()
    private var currentIndex: Int = 0
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupViewController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController.dataSource = self
        self.pageController.delegate = self
        pageController.view.backgroundColor = .black
        
        self.addChild(pageController)
        self.view.addSubview(pageController.view)
        
        controllers = createViewControllers()
        
        self.pageController.setViewControllers([controllers[0]], direction: .forward, animated: false, completion: nil)
        self.pageController.didMove(toParent: self)
        
    }
    
    private func createViewControllers() -> [UIViewController] {
        for x in 1 ... (presenter.infoOfRocket?.count ?? 1) {
            let vc = tableViewController()
            vc.information = presenter.infoOfRocket![x - 1]
            vc.view.backgroundColor = randomColor()
            vc.view.addSubview(self.tableView)
            controllers.append(vc)
        }
        return controllers
    }
    
    private func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    private func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }

}

extension MainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return controllers[0]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        setupViewController()
    }
    
    func error(error: Error) {
        let allert = UIAlertController(title: "Ошибка", message: "Проверьте подклчение к интернету", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) {[weak self] action in
            guard let self = self else { return }
            
            self.presenter.getInfo()
        }
        allert.addAction(action)
        present(allert, animated: true)
    }
}

