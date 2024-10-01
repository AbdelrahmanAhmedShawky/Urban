//
//  CleaningDetailsVC.swift
//  Urban
//
//  Created by Zain on 03/09/2024.
//

import UIKit

class CleaningDetailsVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTitle = "Cleaning Service"
        type = .cleaningService
        configureUI()
        // Do any additional setup after loading the view.
    }
    private func configureUI() {
        
        tableView.register(UINib.init(nibName: "CleaningCell", bundle: nil), forCellReuseIdentifier: "CleaningCell")
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        self.tableView.layoutIfNeeded()
        
    }
    @IBAction func chooseTimingAction(_ sender: Any) {
        Coordinator.goToServiceLocation(delegate: self,type: "C")
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
    @IBAction func showTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.serviceBooking.instance.instantiateViewController(withIdentifier: "ServiceBreakDownVC") as! ServiceBreakDownVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
   
}
extension CleaningDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CleaningCell") as! CleaningCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dropDownVC = Storyboard.designing.instance.instantiateViewController(withIdentifier: "selectQuantity") as! selectQuantity
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
    }
}
