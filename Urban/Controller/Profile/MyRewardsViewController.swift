//
//  MyRewardsViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/28/24.
//

import UIKit

class MyRewardsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = "My Rewards"
        type = .myProfile

        configureUI()
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
    private func configureUI() {
        
        tableView.register(UINib.init(nibName: "MyRewardsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyRewardsTableViewCell")
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        
    }
    @IBAction func inviteFriendAction(_ sender: Any) {
        Coordinator.goToInviteFriendVC(delegate: self)
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

extension MyRewardsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRewardsTableViewCell") as! MyRewardsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
