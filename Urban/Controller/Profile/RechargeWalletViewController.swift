//
//  RechargeWalletViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/28/24.
//

import UIKit

class RechargeWalletViewController: BaseViewController {

    
    @IBOutlet weak var mamoBgView: Gradient!
    @IBOutlet weak var payBgView: Gradient!
    @IBOutlet weak var appleBgView: Gradient!
    
    @IBOutlet weak var mamoTick: UIImageView!
    @IBOutlet weak var payTick: UIImageView!
    @IBOutlet weak var appleTick: UIImageView!
    
    var selectedPaymentMethod: WalletRechargePaymentMethod? = .mamo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = "Recharge Wallet"
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
    
    func updatePaymentMethodViews() {
        mamoBgView.isHidden = selectedPaymentMethod != .mamo
        payBgView.isHidden = selectedPaymentMethod != .pay
        appleBgView.isHidden = selectedPaymentMethod != .apple
    }
    
    func selectPaymentMethod(_ method: WalletRechargePaymentMethod) {
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
        payTick.image = UIImage(named: "tick-grey")
        appleTick.image = UIImage(named: "tick-grey")
    }

    @IBAction func mamoAction(_ sender: Any) {
        selectPaymentMethod(.mamo)
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
enum WalletRechargePaymentMethod: String {
    case mamo = "Mamo"
    case pay = "Pay"
    case apple = "Apple"
}
