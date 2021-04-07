//
//  HomePresenter.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation

class HomePresenter {
  private unowned var view: HomeViewProtocol?
  var interactor: HomeInteractorInputProtocol?
  
  init(_view: HomeViewProtocol) {
    view = _view
  }
}

extension HomePresenter: HomePresenterProtocol {
  func getWorkout(type: WorkoutType) {
    interactor?.getData(for: type)
  }
}

extension HomePresenter: HomeInteractorOutputProtocol {
  func update(data: HomeBaseModel) {
    view?.update(data: data)
  }
  
  func update(data: StudioBaseModel) {
    view?.update(data: data)
  }
}
