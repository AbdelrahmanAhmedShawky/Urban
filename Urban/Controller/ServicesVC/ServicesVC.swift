//
//  ServicesVC.swift
//  Urban
//
//  Created by Zain on 30/08/2024.
//

import UIKit

class ServicesVC: BaseViewController {
    
    var selectedItem = -1
    var selectedItemHour = -1
    var optionsArray = ["1 Maid", "2 Maids","3 Maids","4 Maids","5 Maids"]
    var hourArray = ["1 Hour", "2 Hours","3 Hours","4 Hours","5 Hours"]
    
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var officeImg: UIImageView!
    
    @IBOutlet weak var homeTick: UIImageView!
    @IBOutlet weak var officeTick: UIImageView!
    
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var officeLbl: UILabel!
    
    @IBOutlet weak var packagsTbl: IntrinsicallySizedTableView!
    @IBOutlet weak var choseOptions: IntrinsicCollectionView!
    @IBOutlet weak var choseHours: IntrinsicCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTitle = "Maid Services"
        type = .serviceBooking
        configureUI()
        resetData()
        // Do any additional setup after loading the view.
    }
    private func configureUI() {
        packagsTbl.register(UINib.init(nibName: "PackagesCell", bundle: nil), forCellReuseIdentifier: "PackagesCell")
        packagsTbl.reloadData()
        packagsTbl.layoutIfNeeded()
        
        choseOptions.delegate = self
        choseOptions.dataSource = self
        choseOptions.register(UINib.init(nibName: "TimeViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeViewCell")
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        layout2.minimumInteritemSpacing = 0
        layout2.minimumLineSpacing = 0
        self.choseOptions.collectionViewLayout = layout2
        self.choseOptions.reloadData()
        self.choseOptions.layoutIfNeeded()
        
        
        choseHours.delegate = self
        choseHours.dataSource = self
        choseHours.register(UINib.init(nibName: "TimeViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.choseHours.collectionViewLayout = layout
        self.choseHours.reloadData()
        self.choseHours.layoutIfNeeded()
    }
    func resetData() {
        homeImg.isHidden = true
        officeImg.isHidden = true
        homeTick.image = UIImage(named: "Group 1")
        officeTick.image = UIImage(named: "Group 1")
        homeLbl.textColor = UIColor(hex: "1B1B1B")
        officeLbl.textColor = UIColor(hex: "1B1B1B")
    }
    @IBAction func homeTab(_ sender: UIButton) {
        resetData()
        homeImg.isHidden = false
        homeTick.image = UIImage(named: "Group 2")
        homeLbl.textColor = UIColor(hex: "FFFFFF")
    }
    @IBAction func officeTab(_ sender: UIButton) {
        resetData()
        officeImg.isHidden = false
        officeTick.image = UIImage(named: "Group 2")
        officeLbl.textColor = UIColor(hex: "FFFFFF")
    }
    @IBAction func proceedTab(_ sender: UIButton) {
        Coordinator.goToServiceLocation(delegate: self)
    }
    override func addinfoTab() {
        Coordinator.goToServiceDetails(delegate: self)
    }
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tabbar = tabBarController as? TabbarController
        tabbar?.hideTabBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let tabbar = tabBarController as? TabbarController
        tabbar?.showTabBar()
    }
}
extension ServicesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackagesCell") as! PackagesCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension ServicesVC: UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.choseOptions {
            return optionsArray.count
        }else {
            return hourArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeViewCell", for: indexPath) as? TimeViewCell else { return UICollectionViewCell() }
        cell.img.isHidden = true
        if collectionView == self.choseOptions {
            cell.namelbl.text = optionsArray[indexPath.row]
            if self.selectedItem == indexPath.row {
                cell.img.isHidden = false
                cell.tick.image = UIImage(named: "tick-white")
                cell.namelbl.textColor = .white
            }else {
                cell.tick.image = UIImage(named: "tick-grey")
                cell.namelbl.textColor = UIColor(hex: "1B1B1B")
            }
        }else {
            cell.namelbl.text = hourArray[indexPath.row]
            if self.selectedItemHour == indexPath.row {
                cell.img.isHidden = false
                cell.tick.image = UIImage(named: "tick-white")
                cell.namelbl.textColor = .white
            }else {
                cell.tick.image = UIImage(named: "tick-grey")
                cell.namelbl.textColor = UIColor(hex: "1B1B1B")
            }
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        return CGSize(width: ((bounds.width - 30)/3), height:50)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.choseOptions {
            self.selectedItem = indexPath.row
            self.choseOptions.reloadData()
        }else {
            self.selectedItemHour = indexPath.row
            self.choseHours.reloadData()
        }
    }
}
