//
//  HomeRouter.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import UIKit
class HomeRouter: HomeRouterProtocol {
  private unowned var view: UIViewController
  
  init(_view: UIViewController) {
    view = _view
  }
  
  func open() {
    print("Open it")
  }
}
