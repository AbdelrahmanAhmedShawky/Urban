//
//  CleaningConfirmDetailsViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 9/2/24.
//

import UIKit

class CleaningConfirmDetailsViewController: UIViewController {

    weak var delegate : ConfirmDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

    @IBAction func addTocart(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.moveToNext(type: "C")
        }
    }
    
    @IBAction func proceed(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.moveToNext(type: "C")
        }
    }
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    //Coordinator.goToCongratulationsVC(delegate: self)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
