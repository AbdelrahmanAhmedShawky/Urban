//
//  SetLocation.swift
//  Urban
//
//  Created by Zain on 29/08/2024.
//

import UIKit

class SetLocation: UIViewController {

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
    @IBAction func confirmAction(_ sender: Any) {
        Coordinator.gotoTabbar()
    }
    
}
