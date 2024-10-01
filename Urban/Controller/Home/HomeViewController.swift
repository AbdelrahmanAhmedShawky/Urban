//
//  HomeViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit
import SDWebImage

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var topTableView: IntrinsicallySizedTableView!
    
    @IBOutlet weak var bottomTableView: IntrinsicallySizedTableView!
    @IBOutlet weak var collectionView: IntrinsicCollectionView!
    
    
    var sliderData: [SliderData] = []
    var sliderDataBottom: [BannerData] = []
    var categories: [Categorys] = []
    var services: [Service] = []
    var pests1: [Service] = []
    var pests: [PestItem] = []
    var servicesByCategory: [ServiceByCategory] = []
    
    var topImages: [UIImage]? = [
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //        loadData()
        fetchHomeData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        ////        categories = [
        ////            CategoryItem(name: "Maid Service", userImage: "img-1", backgroundColor: "#FFF2E2"),
        ////            CategoryItem(name: "Sofa, Carpet, Mattress, Curtain", userImage: "img2", backgroundColor: "#ECFFD6"),
        ////            CategoryItem(name: "Pest Control Treatment", userImage: "img-3", backgroundColor: "#F6F6FF"),
        ////            CategoryItem(name: "Full Deep Cleaning", userImage: "img4", backgroundColor: "#FFEBF7"),
        ////            CategoryItem(name: "Salon At Home", userImage: "img5", backgroundColor: "#FFF2E2"),
        ////            CategoryItem(name: "Pet Grooming", userImage: "img6", backgroundColor: "#FFF5CE"),
        ////            CategoryItem(name: "Laundry Service", userImage: "img7", backgroundColor: "#F5FFD5"),
        ////            CategoryItem(name: "Painting Service", userImage: "img8", backgroundColor: "#E0FFFE"),
        ////            CategoryItem(name: "Car Wash", userImage: "img9", backgroundColor: "#F3FFCA"),
        ////            CategoryItem(name: "Plumber Service", userImage: "img-1", backgroundColor: "#FFF2E2"),
        ////            CategoryItem(name: "AC Cleaning Service", userImage: "img2", backgroundColor: "#ECFFD6"),
        ////            CategoryItem(name: "Handyman Service", userImage: "img-3", backgroundColor: "#F6F6FF"),
        ////            CategoryItem(name: "Disinfection Service", userImage: "img4", backgroundColor: "#FFEBF7"),
        ////            CategoryItem(name: "SPA At Home", userImage: "img5", backgroundColor: "#FFF2E2"),
        ////            CategoryItem(name: "Electrical Service", userImage: "img6", backgroundColor: "#FFF5CE"),
        ////        ]
        //
        //
        //        pests = [
        //            PestItem(name: "Cleaning Full\nHouse", price: "AED\n20.00", userImage: "img2", backgroundImage: "layer"),
        //            PestItem(name: "Cleaning Full\nHouse", price: "AED\n20.00", userImage: "img-3", backgroundImage: "layer1"),
        //            PestItem(name: "Cleaning Full\nHouse", price: "AED\n20.00", userImage: "img2", backgroundImage: "layer")
        //            ]
        //
        //        topTableView.reloadData()
        //        bottomTableView.reloadData()
        //        collectionView.reloadData()
    }
    private func configureUI() {
        
        topTableView.register(UINib.init(nibName: "ImageCarouselCell", bundle: nil), forCellReuseIdentifier: "ImageCarouselCell")
        
        collectionView.register(UINib.init(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
        
        bottomTableView.register(UINib.init(nibName: "bottomImageCarouselCell", bundle: nil), forCellReuseIdentifier: "bottomImageCarouselCell")
        
        topTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        topTableView.showsVerticalScrollIndicator = false
//        topTableView.reloadData()
        
        bottomTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        bottomTableView.showsVerticalScrollIndicator = false
//        bottomTableView.reloadData()
    }
    
    private func updateUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func notificationAction(_ sender: Any) {
        Coordinator.goToNotificationsVC(delegate: self)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        Coordinator.goToSearchVC(delegate: self)
    }
    @IBAction func droplocation(_ sender: Any) {
        let dropDownVC = Storyboard.loc.instance.instantiateViewController(withIdentifier: "LocationSelection") as! LocationSelection
        dropDownVC.showEdit = false
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    
    func fetchHomeData() {
        HomeScreenAPIManager.fetchHomeData { result in
            guard let homeData = result else {
                Utilities.showWarningAlert(message: "Failed to fetch home data.")
                return
            }
            
            switch homeData.status {
            case "1":
                // Handle successful response
                print("Home Data:", homeData.data)
                // Update your UI with the fetched data here
                self.updateUI(with: homeData.data)
            default:
                // Show warning alert for errors
                Utilities.showWarningAlert(message: homeData.message)
            }
        }
    }
    
    private func updateUI(with data: HomeData) {
        // Update your UI elements based on the fetched data
        // For example, reload tables, update images, etc.
        
        //            let sliderData: [SliderData]
        //            let services: [Service]
        //            let categories: [Categorys]
        //            let bannerData: [BannerData]
        //            let mostBookedServices: [MostBookedService]
        //            let servicesByCategory: [ServiceByCategory]
        
        
        let id: String
        let title: String
        let image: String
        let subCateYes: String
        
        self.sliderData = data.sliderData
        self.sliderDataBottom = data.bannerData
        self.services = data.services
        //                .map { service in
        //                Service(id: "", title: "", image: service.image, price: service.price, subCateYes: "")
        //            }
        
        self.categories = data.categories
        self.pests1 = data.mostBookedServices.map { pest in
            Service(id: "", title: pest.title, image: pest.image, price: pest.price, subCateYes: "")
//            PestItem(name: pest.title, price: pest.price.value, userImage: pest.image, backgroundImage: "layer") // Adjust as necessary
        }
        
        self.pests = data.servicesByCategory.map { pest in
            PestItem(name: pest.name, price: pest.price.value, userImage: pest.thumbnailImg, backgroundImage: "layer") // Adjust as necessary
        }
        
        self.servicesByCategory = data.servicesByCategory
        
        self.topTableView.reloadData()
        self.bottomTableView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = HomeDataBanners.allCases[indexPath.row]
        
        if tableView == topTableView {
            
            let cell = topTableView.dequeueReusableCell(withIdentifier: "ImageCarouselCell") as! ImageCarouselCell
            cell.type = type
            switch type {
            case .head:
                cell.sliderData = sliderData
                cell.titleText = "Special Offers"
                cell.viewAllButton.isHidden = true
                return cell
            case .services:
                cell.serviceData = services
                cell.type = .services
                cell.shouldHideViewAll = false
                cell.titleText = "Pick up where you left off"
                cell.viewAllButton.isHidden = true
                cell.shouldHidePageControlView = true
            case .pest:
                cell.serviceData = services
                cell.type = .services
                cell.shouldHideViewAll = false
                cell.titleText = "Pick up where you left off"
                cell.viewAllButton.isHidden = true
                cell.shouldHidePageControlView = true
            }
            
            cell.parent = self
            
            cell.selectionStyle = .none
            return cell
        }else{
            
            let cell = bottomTableView.dequeueReusableCell(withIdentifier: "bottomImageCarouselCell") as! bottomImageCarouselCell
            cell.type = type
            switch type {
            case .head:
                cell.bannerData = sliderDataBottom
                cell.titleText = "top"
                cell.shouldHideViewAll = true
                return cell
            case .services:
//                cell.topBanner = topImages
                cell.serviceData = self.pests1
                cell.shouldHideViewAll = false
                cell.titleText = "Most Booked Services"
                cell.shouldHidePageControlView = true
            case .pest:
                cell.pestData = pests
                cell.shouldHideViewAll = false
                cell.titleText = "Cleaning and Pest Control"
                cell.shouldHidePageControlView = true
            }
            
            cell.parent = self
            
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeDataBanners.allCases.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = HomeDataBanners.allCases[indexPath.row]
        switch type {
            
        case .head:
            if tableView == topTableView{
                return 250
            }else{
                return 150
            }
        case .services:
            return 150
        case .pest:
            if tableView == bottomTableView{
                return 220
            }else{
                return 0
            }
        default:
            return 230
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as? CategoryCollectionCell else { return UICollectionViewCell() }
        let data = categories[indexPath.row]
        cell.bgView.backgroundColor = UIColor(hex: "#FFF5CE")
        cell.categoryImageView.sd_setImage(with: URL(string: data.image), placeholderImage: UIImage(named: "placeholder_profile"))
        cell.nameLabel.text = data.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 3.1, height: self.collectionView.frame.width / 2.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Coordinator.goToServiceVC(delegate: self)
    }
}
enum HomeDataBanners:String,CaseIterable {
    case head = "head"
    case services = "services"
    case pest = "pest"
    var title : String?{
        switch self {
        case .head:
            return nil
        case .services:
            return nil
        case .pest:
            return nil
        }
    }
}


struct CategoryItem {
    let name: String
    let userImage: String
    let backgroundColor: String
}

struct ServiceItem {
    let name: String
    let price: String
    let userImage: String
    let backgroundColor: String
}

struct PestItem {
    let name: String
    let price: String
    let userImage: String
    let backgroundImage: String
}
