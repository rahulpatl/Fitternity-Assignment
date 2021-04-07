//
//  TempCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 06/04/21.
//

import UIKit

class ProductTagsCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var productTagImage: CustomImageView!
  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var descriptionLabel: UILabel!
  static let fixedSize = CGSize(width: 84, height: 60)
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configUI()
  }
  
  private func configUI() {
    productTagImage.layer.cornerRadius = productTagImage.bounds.width / 2
    parentView.layer.cornerRadius = productTagImage.bounds.width / 2
    productTagImage.layer.borderColor = UIColor(named: "BorderYellow")!.cgColor
    productTagImage.layer.borderWidth = 1
    parentView.layer.borderColor = UIColor(named: "BorderYellow")!.cgColor
    parentView.layer.borderWidth = 1
    titleLabel.font = UIFont(with: .MEDIUM, of: .SMALL)
    descriptionLabel.font = UIFont(with: .REGULAR, of: .SMALL)
  }
  
  func set(data: ProductTag) {
    productTagImage.image = nil
    titleLabel.text = data.title
    descriptionLabel.text = data.text
    productTagImage.setImg(from: data.image)
  }
}
