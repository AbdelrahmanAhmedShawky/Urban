//
//  EditAddress.swift
//  Urban
//
//  Created by Zain on 30/08/2024.
//

import UIKit

protocol EditAddressDelegate : AnyObject {
    func saveAdd(isType:String)
}
class EditAddress: UIViewController {
    
    weak var delegate : EditAddressDelegate?
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var officeImg: UIImageView!
    @IBOutlet weak var workImg: UIImageView!
    
    @IBOutlet weak var homeTick: UIImageView!
    @IBOutlet weak var officeTick: UIImageView!
    @IBOutlet weak var workTick: UIImageView!
    
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var officeLbl: UILabel!
    @IBOutlet weak var workLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    func resetData() {
        homeImg.isHidden = true
        officeImg.isHidden = true
        workImg.isHidden = true
        homeTick.image = UIImage(named: "Group 1")
        officeTick.image = UIImage(named: "Group 1")
        workTick.image = UIImage(named: "Group 1")
        homeLbl.textColor = UIColor(hex: "1B1B1B")
        officeLbl.textColor = UIColor(hex: "1B1B1B")
        workLbl.textColor = UIColor(hex: "1B1B1B")
    }
    @IBAction func homeTab(_ sender: UIButton) {
        resetData()
        homeImg.isHidden = false
        homeTick.image = UIImage(named: "Group 2")
        homeLbl.textColor = UIColor(hex: "FFFFFF")
    }
    @IBAction func officeTab(_ sender: UIButton) {
        resetData()
        officeImg.isHidden = false
        officeTick.image = UIImage(named: "Group 2")
        officeLbl.textColor = UIColor(hex: "FFFFFF")
    }
    @IBAction func workTab(_ sender: UIButton) {
        resetData()
        workImg.isHidden = false
        workTick.image = UIImage(named: "Group 2")
        workLbl.textColor = UIColor(hex: "FFFFFF")
    }
    @IBAction func saveTab(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.saveAdd(isType: "")
        }
    }
    @IBAction func showLoc(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.saveAdd(isType: "L")
        }
    }
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }

}
