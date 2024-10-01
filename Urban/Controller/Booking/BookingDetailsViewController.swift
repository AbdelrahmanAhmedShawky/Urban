//
//  BookingDetailsViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/29/24.
//

import UIKit

class BookingDetailsViewController: BaseViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var modifyView: UIView!
    @IBOutlet weak var trackPartnerView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var supportButton: UIButton!
    
    var selectedBookingType: BookingType?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllerTitle = "Booking Details"
        type = .myProfile
        
        if selectedBookingType == .upcoming {
            supportButton.isHidden = false
            modifyView.isHidden = false
            trackPartnerView.isHidden = true
            ratingView.isHidden = true
            statusLabel?.text = "Upcoming"
            statusLabel?.textColor = UIColor(hex: "#FF9100")
        } else if selectedBookingType == .onTheWay {
            supportButton.isHidden = true
            modifyView.isHidden = true
            trackPartnerView.isHidden = false
            ratingView.isHidden = true
            statusLabel?.text = "On the Way"
            statusLabel?.textColor = UIColor(hex: "#1288EF")
        } else if selectedBookingType == .completed {
            supportButton.isHidden = true
            modifyView.isHidden = true
            trackPartnerView.isHidden = true
            ratingView.isHidden = false
            statusLabel?.text = "Completed"
            statusLabel?.textColor = UIColor(hex: "#08CC08")
        }
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
    @IBAction func serviceDetailsAction(_ sender: Any) {
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "ServiceDetailsViewController") as! ServiceDetailsViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    
    @IBAction func modifyAction(_ sender: Any) {
        let dropDownVC = Storyboard.booking.instance.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    @IBAction func trackPartnerAction(_ sender: Any) {
        Coordinator.goToTrackVC(delegate: self)
    }
    @IBAction func ratingAction(_ sender: Any) {
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "ReviewAndRatingViewController") as! ReviewAndRatingViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
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

