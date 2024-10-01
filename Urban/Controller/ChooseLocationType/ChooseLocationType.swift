//
//  ChooseLocationType.swift
//  Urban
//
//  Created by Zain on 28/08/2024.
//

import UIKit

class ChooseLocationType: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func currentLoc(_ sender: Any) {
        Coordinator.gotoTabbar()
    }
    @IBAction func manualTab(_ sender: Any) {
        let dropDownVC = Storyboard.loc.instance.instantiateViewController(withIdentifier: "EditAddress") as! EditAddress
        dropDownVC.delegate = self
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
}
extension ChooseLocationType:EditAddressDelegate,LocationSelectionDelegate {
    func saveAdd(isType: String) {
        if isType == "L" {
            let dropDownVC = Storyboard.loc.instance.instantiateViewController(withIdentifier: "LocationSelection") as! LocationSelection
            dropDownVC.modalPresentationStyle = .overFullScreen
            dropDownVC.delegate = self
            self.present(dropDownVC, animated: true, completion: nil)
        }else {
            Coordinator.gotoTabbar()
        }
    }
    func addNewAdd() {
        Coordinator.goToSetLocation(delegate: self)
    }
    
}
