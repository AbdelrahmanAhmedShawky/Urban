//
//  CancelBookingViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/30/24.
//

import UIKit

class CancelBookingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigation()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func noAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func yesAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
