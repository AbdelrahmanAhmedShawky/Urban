//
//  ServiceDetails.swift
//  Urban
//
//  Created by Zain on 31/08/2024.
//

import UIKit

class ServiceDetails: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTitle = "Maid Services"
        type = .servicedetails
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
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
}
