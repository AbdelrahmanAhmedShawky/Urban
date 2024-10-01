//
//  LocationSelection.swift
//  Urban
//
//  Created by Zain on 30/08/2024.
//

import UIKit

protocol selectQuantityDelegate : AnyObject {
    func addNewAdd()
}
class selectQuantity: UIViewController {
    weak var delegate : selectQuantityDelegate?
    @IBOutlet weak var table: IntrinsicallySizedTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    private func configureUI() {
        
        table.register(UINib.init(nibName: "selectQuantityCell", bundle: nil), forCellReuseIdentifier: "selectQuantityCell")
        
        table.reloadData()
        table.layoutIfNeeded()
        
    }
    @IBAction func saveTab(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
}
extension selectQuantity: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectQuantityCell") as! selectQuantityCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
