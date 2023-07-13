//
//  MainPresenter.swift
//  SnapkitTest
//
//  Created by Alex on 16.08.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func error(error: Error)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getInfo()
    var infoOfRocket: [InfoForRocket]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var infoOfRocket: [InfoForRocket]?
    let networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getInfo()
    }
    
    func getInfo() {
        networkService.getInfoAboutRockets { [weak self] rezult in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch rezult {
                case .success(let info):
                    self.infoOfRocket = info
                    self.view?.success()
                case .failure(let error):
                    self.view?.error(error: error)
                }
            }
        }
    }
}
