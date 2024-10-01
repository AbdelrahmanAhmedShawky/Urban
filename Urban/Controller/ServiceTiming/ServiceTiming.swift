//
//  ServiceTiming.swift
//  Urban
//
//  Created by Zain on 31/08/2024.
//

import UIKit

class ServiceTiming: BaseViewController {

    var selectedItem = -1
    var optionsArray = ["Monday", "Tuesday","Wednessday","Thursday","Friday","Saturday"]
    @IBOutlet weak var choseOptions: IntrinsicCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTitle = "Maid Services"
        type = .servicedetails
        self.configureUI()
        // Do any additional setup after loading the view.
    }
    private func configureUI() {
        choseOptions.delegate = self
        choseOptions.dataSource = self
        choseOptions.register(UINib.init(nibName: "ServiceTimeViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceTimeViewCell")
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        layout2.minimumInteritemSpacing = 0
        layout2.minimumLineSpacing = 0
        self.choseOptions.collectionViewLayout = layout2
        self.choseOptions.reloadData()
        self.choseOptions.layoutIfNeeded()
    }
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    @IBAction func showPayment(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ConfirmDetails") as! ConfirmDetails
        dropDownVC.delegate = self
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
extension ServiceTiming: UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return optionsArray.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceTimeViewCell", for: indexPath) as? ServiceTimeViewCell else { return UICollectionViewCell() }
        cell.img.isHidden = true
       
            cell.namelbl.text = optionsArray[indexPath.row]
            if self.selectedItem == indexPath.row {
                cell.img.isHidden = false
                cell.tick.image = UIImage(named: "tick-white")
                cell.namelbl.textColor = .white
            }else {
                cell.tick.image = UIImage(named: "tick-grey")
                cell.namelbl.textColor = UIColor(hex: "1B1B1B")
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        return CGSize(width: ((bounds.width - 30)/2), height:50)
        
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
        
            self.selectedItem = indexPath.row
            self.choseOptions.reloadData()
       
    }
}
extension ServiceTiming: ConfirmDetailsDelegate {
    func moveToNext(type: String) {
        if type == "C" {
            self.tabBarController?.selectedIndex = 2
        }else {
            Coordinator.goToCheckOutVC(delegate: self)
        }
    }
    
}
