//
//  CongratulationsViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/29/24.
//

import UIKit

class CongratulationsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hideNavigation()
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

    @IBAction func anotherAction(_ sender: Any) {
        Coordinator.gotoTabbar()
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
