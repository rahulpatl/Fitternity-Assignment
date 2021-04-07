//
//  CategoriesCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

class CategoriesCell: UITableViewCell {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!
  @IBOutlet weak var knowMoreLabel: UILabel!
  @IBOutlet weak var offerDescriptionLabel: UILabel!
  @IBOutlet weak var offerImage: CustomImageView!
  @IBOutlet weak var offerView: UIView!
  
  private var categories: Categories?
  override func awakeFromNib() {
    super.awakeFromNib()
    configureUI()
  }
  
  private func configureUI() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 130, height: 170)
    collectionView.collectionViewLayout = layout
    collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.showsHorizontalScrollIndicator = false
    offerView.layer.cornerRadius = 8
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func set(data: Categories) {
    categories = data
    titleLabel.text = data.title
    subTitleLabel.text = data.text
    offerDescriptionLabel.text = data.campaign.title
    offerImage.setImg(from: data.campaign.image)
    offerView.backgroundColor = data.campaign.bgColor.hexStringToUIColor()
    reloadData()
  }
  
  private func reloadData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}


extension CategoriesCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories?.categorytags.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell
    cell?.set(data: (categories?.categorytags[indexPath.item])!)
    return cell!
  }
}
