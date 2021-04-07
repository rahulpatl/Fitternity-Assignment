//
//  UINavigationControllerX.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import UIKit

extension UINavigationController {
  func configureNavigation(with button: UIButton) {
    DispatchQueue.main.async {
      let firstFrame = CGRect(x: 4, y: 0, width: self.navigationBar.frame.width/2, height: self.navigationBar.frame.height/2)
      let secondFrame = CGRect(x: 4, y: self.navigationBar.frame.height/2, width: self.navigationBar.frame.width/2, height: self.navigationBar.frame.height/2)
      
      let title = UILabel(frame: firstFrame)
      title.text = "YOUR LOCATION"
      title.textColor = .gray
      title.font = UIFont(with: .LIGHT, of: .SMALL)
      
      button.frame = secondFrame
      button.setTitleColor(.gray, for: .normal)
      button.contentHorizontalAlignment = .left
      button.titleLabel?.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
      
      self.navigationBar.addSubview(title)
      self.navigationBar.addSubview(button)
    }
  }
}
