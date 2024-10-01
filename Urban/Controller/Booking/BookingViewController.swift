//
//  BookingViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit

class BookingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = "Bookings"
        type = .bookings

        configureUI()
        // Do any additional setup after loading the view.
    }
   
    private func configureUI() {
        
        tableView.register(UINib.init(nibName: "BookingTableViewCell", bundle: nil), forCellReuseIdentifier: "BookingTableViewCell")
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func payAction(_ sender: Any) {
        
    }
    @IBAction func checkOutAction(_ sender: Any) {
        Coordinator.goToCheckOutVC(delegate: self)
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

extension BookingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell") as! BookingTableViewCell
        
        if indexPath.row == 0 || indexPath.row == 1{
            cell.statusLabel.text = "Upcoming"
            cell.statusLabel.textColor = UIColor(hex: "#FF9100")
            
            cell.supportButton.isHidden = false
            cell.reinitiateButton.isHidden = true
            cell.trackButton.isHidden = true
            cell.modifyView.isHidden = false
            cell.reviewView.isHidden = true
        }else if indexPath.row == 2 || indexPath.row == 3{
            cell.statusLabel.text = "On the Way"
            cell.statusLabel.textColor = UIColor(hex: "#1288EF")
            
            cell.supportButton.isHidden = false
            cell.reinitiateButton.isHidden = true
            cell.trackButton.isHidden = false
            cell.modifyView.isHidden = false
            cell.reviewView.isHidden = true
        }else{
            cell.statusLabel.text = "Completed"
            cell.statusLabel.textColor = UIColor(hex: "#08CC08")
            
            cell.supportButton.isHidden = true
            cell.reinitiateButton.isHidden = false
            cell.trackButton.isHidden = true
            cell.modifyView.isHidden = true
            cell.reviewView.isHidden = false
        }
        
        cell.supportButton.tag = indexPath.row
        cell.supportButton.addTarget(self, action: #selector(supportTapped(_:)), for: .touchUpInside)
        
        cell.reinitiateButton.tag = indexPath.row
        cell.reinitiateButton.addTarget(self, action: #selector(reinitiateTapped(_:)), for: .touchUpInside)
        
        cell.trackButton.tag = indexPath.row
        cell.trackButton.addTarget(self, action: #selector(trackTapped(_:)), for: .touchUpInside)
        
        cell.modifyButton.tag = indexPath.row
        cell.modifyButton.addTarget(self, action: #selector(modifyTapped(_:)), for: .touchUpInside)
        
        cell.reviewsButton.tag = indexPath.row
        cell.reviewsButton.addTarget(self, action: #selector(reviewTapped(_:)), for: .touchUpInside)
                
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 || indexPath.row == 1{
            Coordinator.goToBookingDetailsVC(delegate: self, bookingType: .upcoming)
            
        }else if indexPath.row == 2 || indexPath.row == 3{
            Coordinator.goToBookingDetailsVC(delegate: self, bookingType: .onTheWay)
            
        }else{
            Coordinator.goToBookingDetailsVC(delegate: self, bookingType: .completed)
        }
        
    }
    
    
    //MARK: - Actions
    @objc func supportTapped(_ sender: UIButton){
        
    }
    @objc func reinitiateTapped(_ sender: UIButton){
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "ReinitiatePopUpViewController") as! ReinitiatePopUpViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    
    @objc func trackTapped(_ sender: UIButton){
        Coordinator.goToTrackVC(delegate: self)
    }
    
    @objc func modifyTapped(_ sender: UIButton){
        let dropDownVC = Storyboard.booking.instance.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
    
    @objc func reviewTapped(_ sender: UIButton){
        let dropDownVC = Storyboard.bookings.instance.instantiateViewController(withIdentifier: "ReviewAndRatingViewController") as! ReviewAndRatingViewController
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
}

enum BookingType {
    case upcoming
    case onTheWay
    case completed
}
