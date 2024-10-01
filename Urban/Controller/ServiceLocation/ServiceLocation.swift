//
//  ServiceLocation.swift
//  Urban
//
//  Created by Zain on 31/08/2024.
//

import UIKit

class ServiceLocation: BaseViewController {
    var typeTxt = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if typeTxt == "C" {
            viewControllerTitle = "Cleaning Services"
        }else {
            viewControllerTitle = "Maid Services"
        }
       
        type = .servicedetails
        // Do any additional setup after loading the view.
    }
    @IBAction func proceedTab(_ sender: UIButton) {
        if typeTxt == "C" {
            Coordinator.goToCleaningChooseDateVC(delegate: self)
        }else {
            Coordinator.goToServiceTiming(delegate: self)
        }
    }
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    @IBAction func showLocation(_ sender: UIButton) {
        let dropDownVC = Storyboard.loc.instance.instantiateViewController(withIdentifier: "EditAddress") as! EditAddress
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
extension ServiceLocation:EditAddressDelegate,LocationSelectionDelegate {
    func saveAdd(isType: String) {
        if isType == "L" {
            let dropDownVC = Storyboard.loc.instance.instantiateViewController(withIdentifier: "LocationSelection") as! LocationSelection
            dropDownVC.modalPresentationStyle = .overFullScreen
            dropDownVC.delegate = self
            self.present(dropDownVC, animated: true, completion: nil)
        }else {
           // Coordinator.gotoTabbar()
        }
    }
    func addNewAdd() {
       // Coordinator.goToSetLocation(delegate: self)
    }
    
}
