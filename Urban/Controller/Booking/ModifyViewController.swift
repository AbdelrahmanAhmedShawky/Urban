//
//  ModifyViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/29/24.
//

import UIKit

class ModifyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hideNavigation()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func rescheduleAction(_ sender: Any) {
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "ModifyDateAndTimeViewController") as! ModifyDateAndTimeViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "CancelBookingViewController") as! CancelBookingViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    @IBAction func supportAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }

}
