//
//  HomeInteractor.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation

class HomeInteractor {
  private var networkClient: NetworkManager
  unowned private var presenter: HomeInteractorOutputProtocol
  init(_presenter: HomeInteractorOutputProtocol, _networkClient: NetworkManager) {
    networkClient = _networkClient
    presenter = _presenter
  }
}

extension HomeInteractor: HomeInteractorInputProtocol {
  func getData(for type: WorkoutType) {
    var url = APIConstants.DOMAIN.rawValue
    
    switch type {
    case .Home:
      url.append(APIConstants.WORKOUT_IN_HOME.rawValue)
      networkClient.fetch(url: url, object: HomeBaseModel.self) { [weak self] (model) in
        guard let self = self else {return}
        self.presenter.update(data: model)
      }
      
    default:
      url.append(APIConstants.WORKOUT_IN_STUDIO.rawValue)
      networkClient.fetch(url: url, object: StudioBaseModel.self) { [weak self] (model) in
        guard let self = self else {return}
        self.presenter.update(data: model)
      }
    }
  }
}
