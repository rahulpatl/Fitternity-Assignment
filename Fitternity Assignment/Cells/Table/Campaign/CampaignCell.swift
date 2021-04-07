//
//  CampaignCell.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 07/04/21.
//

import UIKit

class CampaignCell: UITableViewCell {
  @IBOutlet weak var collectionView: UICollectionView!
  private var capaignData = [CampaignElement]()
  
  var timer = Timer()
  var counter = 0
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureUI()
  }
  
  private func configureUI() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let bounds = UIScreen.main.bounds
    layout.itemSize = CGSize(width: bounds.width, height: self.bounds.height - 10)
    collectionView.collectionViewLayout = layout
    collectionView.register(UINib(nibName: "CampaignImageCell", bundle: nil), forCellWithReuseIdentifier: "CampaignImageCell")
    collectionView.delegate = self
    collectionView.dataSource = self
//    collectionView.scroll
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func set(data: [CampaignElement]) {
    capaignData = data
    reloadData()
    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
  }
  
  @objc func changeImage() {
    
    if counter < capaignData.count {
      let index = IndexPath.init(item: counter, section: 0)
      print("A" + index.description)
      self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
      counter += 1
    } else {
      counter = 0
      let index = IndexPath.init(item: counter, section: 0)
      print("B" + index.description)
      self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
      counter = 1
    }
    
  }
  
  private func reloadData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}

extension CampaignCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return capaignData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignImageCell", for: indexPath) as? CampaignImageCell
    cell?.update(data: capaignData[indexPath.item])
    return cell!
  }
}
