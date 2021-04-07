//
//  OnePassCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

class OnePassCell: UITableViewCell {
  @IBOutlet weak var titleImage: CustomImageView!
  @IBOutlet weak var knowMoreLabel: UILabel!
  @IBOutlet weak var bannerImage: CustomImageView!
  @IBOutlet weak var subTitle: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var offerLabel: UILabel!
  @IBOutlet weak var offerImage: CustomImageView!
  @IBOutlet weak var offerView: UIView!
  @IBOutlet weak var headerLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureUI()
  }
  
  private func configureUI() {
    bannerImage.layer.cornerRadius = 8
    offerView.layer.cornerRadius = 8
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func set(data: OnepassPre) {
    titleImage.setImg(from: data.headerImg)
    bannerImage.setImg(from: data.passes.image)
    offerImage.setImg(from: data.campaign.image)
    
    knowMoreLabel.text = data.buttonText
    subTitle.text = data.passes.descHeader
    descriptionLabel.text = data.passes.passesDescription
    offerLabel.text = data.campaign.title
    
    subTitle.textColor = data.campaign.textColor.hexStringToUIColor()
    descriptionLabel.textColor = data.campaign.textColor.hexStringToUIColor()
    offerView.backgroundColor = data.campaign.bgColor.hexStringToUIColor()
    headerLabel.text = nil
  }
  
  func set(data: PersonalTraining) {
    titleImage.image = nil
    headerLabel.text = data.title
    subTitle.text = data.subtitle
    bannerImage.setImg(from: data.image)
    offerImage.setImg(from: data.campaign.image)
    
    knowMoreLabel.text = data.buttonText
    descriptionLabel.text = data.personalTrainingDescription
    offerLabel.text = data.campaign.title
    
    subTitle.textColor = data.campaign.textColor.hexStringToUIColor()
    descriptionLabel.textColor = data.campaign.textColor.hexStringToUIColor()
    offerView.backgroundColor = data.campaign.bgColor.hexStringToUIColor()
  }
}
