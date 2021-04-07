//
//  CampaignImageCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

class CampaignImageCell: UICollectionViewCell {
  @IBOutlet weak var campaignImage: CustomImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureUI()
  }
  
  private func configureUI() {
    campaignImage.layer.cornerRadius = 8
  }
  
  func update(data: CampaignElement) {
//    campaignImage = nil
    campaignImage.setImg(from: data.image)
  }
}
