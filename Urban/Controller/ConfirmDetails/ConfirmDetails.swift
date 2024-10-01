//
//  ConfirmDetails.swift
//  Urban
//
//  Created by Zain on 30/08/2024.
//

import UIKit
protocol ConfirmDetailsDelegate : AnyObject {
    func moveToNext(type:String)
}
class ConfirmDetails: UIViewController {
    weak var delegate : ConfirmDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTocart(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.moveToNext(type: "C")
        }
    }
    @IBAction func showLoc(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.moveToNext(type: "")
        }
    }
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
}
