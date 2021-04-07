//
//  CategoryCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
  @IBOutlet weak var tagImage: CustomImageView!
  @IBOutlet weak var tagTitleText: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureUI()
  }
  
  private func configureUI() {
    tagImage.layer.cornerRadius = 8
  }
  
  func set(data: Categorytag) {
    tagImage.setImg(from: data.image)
    tagTitleText.text = data.name
  }
}
