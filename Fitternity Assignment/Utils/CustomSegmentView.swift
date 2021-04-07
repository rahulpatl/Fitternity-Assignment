//
//  CustomSegmentView.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

protocol CustomSegmentDelegate: class {
  func didSelect(segment index: Int)
}

class CustomSegmentView: UIView {
  @IBOutlet var segmentTitles: [UILabel]!
  @IBOutlet var segmentImages: [CustomImageView]!
  @IBOutlet var segmentHighlightView: [UIView]!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet var buttonCollections: [UIButton]!
  weak var delegate: CustomSegmentDelegate?
  private var currentIndex: Int = 0
  var selectedSegmentIndex: Int {
    get {
      return currentIndex
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    Bundle.main.loadNibNamed("CustomSegmentView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  
  @IBAction func didTapOnSegment(_ sender: Any) {
    switch sender as? UIButton {
    case buttonCollections[0]:
      highlightSegment(index: 0)
      
    case buttonCollections[1]:
      highlightSegment(index: 1)
      
    default:
      break
    }
  }
  
  private func clearSegments() {
    for i in 0...1 {
      segmentTitles[i].textColor = .gray
      segmentImages[i].tintColor = .gray
      segmentHighlightView[i].backgroundColor = .clear
    }
  }
  
  private func highlightSegment(index: Int) {
    clearSegments()
    currentIndex = index
    switch index {
    case 0:
      segmentTitles[index].textColor = UIColor(named: "BorderYellow")
      segmentImages[index].tintColor = UIColor(named: "BorderYellow")
      segmentHighlightView[index].backgroundColor = UIColor(named: "BorderYellow")
      
    case 1:
      segmentTitles[index].textColor = UIColor(named: "BorderYellow")
      segmentImages[index].tintColor = UIColor(named: "BorderYellow")
      segmentHighlightView[index].backgroundColor = UIColor(named: "BorderYellow")
      
    default:
      break
    }
    delegate?.didSelect(segment: index)
  }
}

extension CustomSegmentView {
  func setSegment(index: Int) {
    highlightSegment(index: index)
  }
}
