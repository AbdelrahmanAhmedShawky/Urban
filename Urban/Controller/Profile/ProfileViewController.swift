//
//  ProfileViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = " Profile"
        type = .profile
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func myProfileAction(_ sender: Any) {
        Coordinator.goToMyProfileVC(delegate: self)
    }
    
    @IBAction func walletAction(_ sender: Any) {
        Coordinator.goToMyWalletVC(delegate: self)
    }
    @IBAction func savedLocationAction(_ sender: Any) {
        Coordinator.goToSaveLocationsVC(delegate: self)
    }
    @IBAction func myRewardsAction(_ sender: Any) {
        Coordinator.goToMyRewardsVC(delegate: self)
    }
    @IBAction func inviteFriendAction(_ sender: Any) {
        Coordinator.goToInviteFriendVC(delegate: self)
    }
    @IBAction func deleteAccountAction(_ sender: Any) {
    }
    @IBAction func logoutAction(_ sender: Any) {
        Utilities.showQuestionAlert(message: "Are you sure you want to logout?") {
            Coordinator.IntroScreen()
        }
    }
    @IBAction func privacyPolicyAction(_ sender: Any) {
        Coordinator.goToPrivacyPolicyVC(delegate: self)
    }
    @IBAction func termsAndConditionsAction(_ sender: Any) {
        Coordinator.goToTermsAndConditionsVC(delegate: self)
    }
    @IBAction func supportAction(_ sender: Any) {
        
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
