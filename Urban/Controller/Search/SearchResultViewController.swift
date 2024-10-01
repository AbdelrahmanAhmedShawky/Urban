//
//  SearchResultViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/31/24.
//

import UIKit

class SearchResultViewController: BaseViewController {
    
    @IBOutlet weak var tableView: IntrinsicallySizedTableView!
    var services: [CategoryItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigation()
        configureUI()
        loadData()
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
    private func loadData(){
        services = [
            CategoryItem(name: "Part time maids", userImage: "img-1", backgroundColor: "#FFF2E2"),
            CategoryItem(name: "Part time maids", userImage: "img2", backgroundColor: "#ECFFD6"),
            CategoryItem(name: "Part time maids", userImage: "img-3", backgroundColor: "#F6F6FF"),
            CategoryItem(name: "Part time maids", userImage: "img-1", backgroundColor: "#FFF2E2"),
            CategoryItem(name: "Part time maids", userImage: "img2", backgroundColor: "#ECFFD6"),
            CategoryItem(name: "Part time maids", userImage: "img-3", backgroundColor: "#F6F6FF"),
            CategoryItem(name: "Part time maids", userImage: "img-1", backgroundColor: "#FFF2E2"),
            
        ]
        tableView.reloadData()
    }
    private func configureUI() {
        
        tableView.register(UINib.init(nibName: "SearchServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchServiceTableViewCell")
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchServiceTableViewCell") as! SearchServiceTableViewCell
        let data = services[indexPath.row]
        cell.bgView.backgroundColor = UIColor(hex: data.backgroundColor)
        cell.categoryImageView.image = UIImage(named: data.userImage)
        cell.nameLabel.text = data.name
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
