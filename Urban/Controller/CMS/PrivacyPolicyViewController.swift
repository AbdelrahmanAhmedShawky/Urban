//
//  PrivacyPolicyViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 9/2/24.
//

import UIKit

class PrivacyPolicyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllerTitle = "Privacy Policy"
        type = .myProfile
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
