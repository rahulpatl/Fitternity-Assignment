//
//  UIFontX.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import UIKit
enum FONT_STYLE: String {
  case LIGHT = "HelveticaNeue-Light"
  case REGULAR = "HelveticaNeue"
  case MEDIUM = "HelveticaNeue-Medium"
  case BOLD = "HelveticaNeue-Bold"
}

enum FONT_SIZE: Float {
    case TITLE      = 20
    case DEFAULT    = 17
    case SUB_TITLE  = 15
    case SMALL      = 13
    case NANO       = 10
    case HEADER1    = 32
    case HEADER2    = 26
    case HEADER3    = 22
}

extension UIFont {
    convenience init(with name: FONT_STYLE,of size: FONT_SIZE) {
        self.init(name: name.rawValue,size: CGFloat(size.rawValue))!
    }
}
