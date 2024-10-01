//
//  CartViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit

class CartViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var services: [ServiceItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = " Cart"
        type = .profile

        configureUI()
        // Do any additional setup after loading the view.
    }
    
    
    private func configureUI() {
        
        tableView.register(UINib.init(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        
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

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
