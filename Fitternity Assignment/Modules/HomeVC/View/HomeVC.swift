//
//  HomeVC.swift
//  Fitternity Assignment
//
//  Created by Rahul Patil on 05/04/21.
//

import UIKit

class HomeVC: UIViewController {
  weak var router: HomeRouterProtocol?
  var presenter: HomePresenterProtocol?
  private var productTags = [ProductTag]()
  private var campaigns = [CampaignElement]()
  private var tableRows = [TableRows]()
  private var onePass: OnepassPre?
  private var personalTraining: PersonalTraining?
  private var categories: Categories?
  private var homeWorkoutModel: HomeBaseModel? {
    didSet {
      if let data = homeWorkoutModel?.productTags {
        productTags = data
      }
      
      if let data = homeWorkoutModel?.campaigns {
        campaigns = data
      }
      
      if let data = homeWorkoutModel?.tableData {
        tableRows = data
      }
      
      if let data = homeWorkoutModel?.onepassPre {
        onePass = data
      }
      
      if let data = homeWorkoutModel?.personalTraining {
        personalTraining = data
      }
    }
  }
  
  private var studioWorkoutModel: StudioBaseModel? {
    didSet {
      if let products = studioWorkoutModel?.productTags {
        productTags = products
      }
      
      if let camps = studioWorkoutModel?.campaigns {
        campaigns = camps
      }
      
      if let rows = studioWorkoutModel?.tableData {
        tableRows = rows
      }
      
      if let data = studioWorkoutModel?.onepassPre {
        onePass = data
      }
      
      if let data = studioWorkoutModel?.categories {
        categories = data
      }
    }
  }
  
  private lazy var segment: CustomSegmentView = {
    let segment = CustomSegmentView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 70))
    segment.delegate = self
    return segment
  }()

  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Mumbai, India ▾", for: .normal)
    return button
  }()
  
  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 4
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    return layout
  }()
  
  private lazy var collection: UICollectionView = {
    let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    collection.backgroundColor = UIColor(named: "TagGray")
    collection.showsHorizontalScrollIndicator = false
    collection.register(UINib(nibName: "ProductTagsCell", bundle: nil), forCellWithReuseIdentifier: "ProductTagsCell")
    
    collection.delegate = self
    collection.dataSource = self
    return collection
  }()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .red
    tableView.register(UINib(nibName: "CampaignCell", bundle: nil), forCellReuseIdentifier: "CampaignCell")
    tableView.register(UINib(nibName: "OnePassCell", bundle: nil), forCellReuseIdentifier: "OnePassCell")
    tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    addCollection()
    segment.setSegment(index: 0)
  }
  
  func addCollection() {
    view.addSubview(collection)
    view.addSubview(segment)
    view.addSubview(tableView)
    
    collection.translatesAutoresizingMaskIntoConstraints = false
    segment.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collection.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    segment.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    segment.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    segment.topAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
    
    segment.layer.shadowOpacity = 0.2
    segment.layer.shadowColor = UIColor.gray.cgColor
    segment.layer.shadowOffset = CGSize(width: 1, height: 1)
    segment.layer.shadowRadius = 4
    
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: segment.bottomAnchor).isActive = true
  }

  func configureUI() {
    view.backgroundColor = .white
    self.navigationController?.configureNavigation(with: button)
  }
}

extension HomeVC: HomeViewProtocol {
  func update(data: HomeBaseModel) {
    homeWorkoutModel = data
    reloadAll()
  }
  
  func update(data: StudioBaseModel) {
    studioWorkoutModel = data
    reloadAll()
  }
  
  private func reloadAll() {
    DispatchQueue.main.async {
      self.collection.reloadData()
      self.tableView.reloadData()
    }
  }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productTags.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductTagsCell", for: indexPath) as? ProductTagsCell
    cell?.set(data: productTags[indexPath.item])
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let titleWidth = productTags[indexPath.item].title.getEstimatedSizeFor(font: UIFont(with: .MEDIUM, of: .SUB_TITLE)).width
    let descriptionWidth = productTags[indexPath.item].text.getEstimatedSizeFor(font: UIFont(with: .REGULAR, of: .SMALL)).width
    let width = titleWidth > descriptionWidth ? titleWidth : descriptionWidth
    return CGSize(width: width + ProductTagsCell.fixedSize.width, height: ProductTagsCell.fixedSize.height)
  }
}

extension HomeVC: CustomSegmentDelegate {
  func didSelect(segment index: Int) {
    switch index {
    case 0:
      presenter?.getWorkout(type: .Studio)
    default:
      presenter?.getWorkout(type: .Home)
    }
  }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableRows.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch tableRows[indexPath.row] {
    case .Campaigns:
      let cell = tableView.dequeueReusableCell(withIdentifier: "CampaignCell", for: indexPath) as? CampaignCell
      cell?.set(data: campaigns)
      return cell!
      
    case .OnepassPre:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OnePassCell", for: indexPath) as? OnePassCell
      cell?.set(data: onePass!)
      return cell!
      
    case .PersonalTraining:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OnePassCell", for: indexPath) as? OnePassCell
      cell?.set(data: personalTraining!)
      return cell!
      
    case .Categories:
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell
      cell?.set(data: categories!)
      return cell!
      
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OnePassCell", for: indexPath) as? OnePassCell
      cell?.set(data: onePass!)
      return cell!
    }

  }
}
