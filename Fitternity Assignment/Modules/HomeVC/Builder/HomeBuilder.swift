//
//  HomeBuilder.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation
protocol HomeBuilderProtocol: AnyObject {
    func buildModule() -> HomeVC
}


final class HomeBuilder: HomeBuilderProtocol {
  
  func buildModule() -> HomeVC {
    let homeVC = HomeVC()
    let presenter = HomePresenter(_view: homeVC)
    let network = NetworkManager()
    let interactor = HomeInteractor(_presenter: presenter, _networkClient: network)
    let router = HomeRouter(_view: homeVC)
    
    presenter.interactor = interactor
    homeVC.router = router
    homeVC.presenter = presenter
    
    return homeVC
  }
}
