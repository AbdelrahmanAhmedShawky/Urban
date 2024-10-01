//
//  LocationSelection.swift
//  Urban
//
//  Created by Zain on 30/08/2024.
//

import UIKit

protocol LocationSelectionDelegate : AnyObject {
    func addNewAdd()
}
class LocationSelection: UIViewController {
    var showEdit = true
    weak var delegate : LocationSelectionDelegate?
    @IBOutlet weak var table: IntrinsicallySizedTableView!
    @IBOutlet weak var addLOc: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        if showEdit {
            addLOc.isHidden = false
        }else {
            addLOc.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    private func configureUI() {
        
        table.register(UINib.init(nibName: "SavedAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedAddressTableViewCell")
        
        table.reloadData()
        table.layoutIfNeeded()
        
    }
    @IBAction func saveTab(_ sender: UIButton) {
        self.dismiss(animated: true){
            self.delegate?.addNewAdd()
        }
    }
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
}
extension LocationSelection: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedAddressTableViewCell") as! SavedAddressTableViewCell
        if self.showEdit {
            cell.btnEdit.isHidden = false
            cell.btnDelete.isHidden = false
        }else {
            cell.btnEdit.isHidden = true
            cell.btnDelete.isHidden = true
        }
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
