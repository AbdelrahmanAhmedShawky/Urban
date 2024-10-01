//
//  CleaningCheckOutViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 9/2/24.
//

import UIKit

class CleaningCheckOutViewController: BaseViewController {
    
    

    @IBOutlet weak var tipOneGradientView: Gradient!
    @IBOutlet weak var tipTwoGradientView: Gradient!
    @IBOutlet weak var tipThreeGradientView: Gradient!
    
    @IBOutlet weak var tipOneButton: UIButton!
    @IBOutlet weak var tipTwoButton: UIButton!
    @IBOutlet weak var tipThreeButton: UIButton!
    
    @IBOutlet weak var mamoButton: UIButton!
    @IBOutlet weak var mamoBgView: Gradient!
    
    @IBOutlet weak var cashButton: UIButton!
    @IBOutlet weak var cashBgView: Gradient!
    
    @IBOutlet weak var tabbyButton: UIButton!
    @IBOutlet weak var tabbyBgView: Gradient!
    
    @IBOutlet weak var payBgView: Gradient!
    @IBOutlet weak var appleBgView: Gradient!
    
    @IBOutlet weak var mamoTick: UIImageView!
    @IBOutlet weak var cashTick: UIImageView!
    @IBOutlet weak var tabbyTick: UIImageView!
    @IBOutlet weak var payTick: UIImageView!
    @IBOutlet weak var appleTick: UIImageView!
    
    
    var selectedPaymentMethod: PaymentMethod? = .mamo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipOneGradientView.isHidden = true
        tipTwoGradientView.isHidden = true
        tipThreeGradientView.isHidden = false
        viewControllerTitle = "Cleaning Service"
        type = .cleaningService
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

    func updatePaymentMethodViews() {
        mamoBgView.isHidden = selectedPaymentMethod != .mamo
        cashBgView.isHidden = selectedPaymentMethod != .card
        tabbyBgView.isHidden = selectedPaymentMethod != .tabby
        payBgView.isHidden = selectedPaymentMethod != .pay
        appleBgView.isHidden = selectedPaymentMethod != .apple
    }
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    func selectPaymentMethod(_ method: PaymentMethod) {
        selectedPaymentMethod = method
        updatePaymentMethodViews()
        updateTickImages()
    }
    func updateTickImages() {
        // Set all tick images to the default (gray) state
        resetTickImages()
        
        // Set the selected tick image to the active (white) state
        switch selectedPaymentMethod {
        case .mamo:
            mamoTick.image = UIImage(named: "tick-white")
        case .card:
            cashTick.image = UIImage(named: "tick-white")
        case .tabby:
            tabbyTick.image = UIImage(named: "tick-white")
        case .pay:
            payTick.image = UIImage(named: "tick-white")
        case .apple:
            appleTick.image = UIImage(named: "tick-white")
        case .none:
            break
        }
    }
    func resetTickImages() {
        // Set all tick images to the default gray state
        mamoTick.image = UIImage(named: "tick-grey")
        cashTick.image = UIImage(named: "tick-grey")
        tabbyTick.image = UIImage(named: "tick-grey")
        payTick.image = UIImage(named: "tick-grey")
        appleTick.image = UIImage(named: "tick-grey")
    }
    
    @IBAction func proceedAction(_ sender: Any) {
        let dropDownVC = Storyboard.designing.instance.instantiateViewController(withIdentifier: "CleaningConfirmDetailsViewController") as! CleaningConfirmDetailsViewController
        dropDownVC.delegate = self
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    @IBAction func tipOneAction(_ sender: Any) {
        tipOneButton.setTitleColor(.white, for: .normal)
        tipTwoButton.setTitleColor(.black, for: .normal)
        tipThreeButton.setTitleColor(.black, for: .normal)
        tipOneGradientView.isHidden = false
        tipTwoGradientView.isHidden = true
        tipThreeGradientView.isHidden = true
    }
    @IBAction func tipTwoAction(_ sender: Any) {
        tipOneButton.setTitleColor(.black, for: .normal)
        tipTwoButton.setTitleColor(.white, for: .normal)
        tipThreeButton.setTitleColor(.black, for: .normal)
        
        tipOneGradientView.isHidden = true
        tipTwoGradientView.isHidden = false
        tipThreeGradientView.isHidden = true
    }
    @IBAction func tipThreeAction(_ sender: Any) {
        tipOneButton.setTitleColor(.black, for: .normal)
        tipTwoButton.setTitleColor(.black, for: .normal)
        tipThreeButton.setTitleColor(.white, for: .normal)
        
        tipOneGradientView.isHidden = true
        tipTwoGradientView.isHidden = true
        tipThreeGradientView.isHidden = false
    }
    
    @IBAction func mamoAction(_ sender: Any) {
        selectPaymentMethod(.mamo)
    }
    
    @IBAction func cashAction(_ sender: Any) {
        selectPaymentMethod(.card)
    }
    
    @IBAction func tabbyAction(_ sender: Any) {
        selectPaymentMethod(.tabby)
    }
    
    @IBAction func payAction(_ sender: Any) {
        selectPaymentMethod(.pay)
    }
    
    @IBAction func appleAction(_ sender: Any) {
        selectPaymentMethod(.apple)
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

extension CleaningCheckOutViewController: ConfirmDetailsDelegate {
    func moveToNext(type: String) {
        if type == "C" {
            Coordinator.goToCleaningThankYouVC(delegate: self)
        }else {
            Coordinator.goToCleaningChechOutVC(delegate: self)
        }
    }
    
}
