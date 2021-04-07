//
//  HomeProtocols.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import Foundation

enum WorkoutType {
  case Home
  case Studio
}

protocol HomeViewProtocol: class {
  var router: HomeRouterProtocol? { get set }
  func update(data: StudioBaseModel)
  func update(data: HomeBaseModel)
}

protocol HomePresenterProtocol: class {
  var interactor: HomeInteractorInputProtocol? { get set }
  func getWorkout(type: WorkoutType)
}

protocol HomeInteractorInputProtocol: class {
  func getData(for type: WorkoutType)
}

protocol HomeInteractorOutputProtocol: class {
  func update(data: StudioBaseModel)
  func update(data: HomeBaseModel)
}

protocol HomeRouterProtocol: class {
  func open()
}
