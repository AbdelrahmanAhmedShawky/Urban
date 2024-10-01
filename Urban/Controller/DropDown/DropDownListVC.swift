//
//  DropDownListVC.swift
//  BuildMart
//
//  Created by Muneeb on 17/07/2023.
//

import UIKit

enum DropDownType {
    case country
    case emirate
    case city
    case nationality
    case gender
    case sort
    case category


}
class DropDownListVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(types: DropDownTableViewCell.self)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var mainHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10.0
            containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            containerView.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topLbl.text = selectedType
        searchField.delegate = self
        

    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text != "" {
            dropDownListSearch.removeAll()
            
            dropDownListSearch = dropDownList.filter({ ($0.name ?? "").range(of: textField.text ?? "", options: .caseInsensitive) != nil })
            self.issearch = true
        }else {
            self.issearch = false
        }
        tableView.reloadData()
    }

    var selectedDropDown: DropDownData?
    var dropDownList: [DropDownData] = []
    var dropDownListSearch: [DropDownData] = []
    var dropDownType: DropDownType = .emirate
    var didUpdateDropDown: ((DropDownType, DropDownData) -> Void) = { _, _ in }
    var selectedType = ""
    var issearch = false
}

// MARK: - Actions
extension DropDownListVC {
    @IBAction func closeActionBtntap(_ sender: Any) {
        dismiss(animated: true){
            if self.selectedDropDown != nil {
                self.didUpdateDropDown(self.dropDownType, self.selectedDropDown!)
            }
        }
    }
}

// MARK: -  UITableView Deleagte & DataSOurce
extension DropDownListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if issearch {
            return dropDownListSearch.count
        }
        return dropDownList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DropDownTableViewCell = tableView.getCell(type: DropDownTableViewCell.self, for: indexPath) else  { return UITableViewCell() }
        cell.img.image = UIImage(named: "RadioButton")
        if issearch {
            if self.selectedDropDown != nil  &&  ((self.selectedDropDown?.id ?? "") == dropDownListSearch[indexPath.row].id ?? ""){
                cell.img.image = UIImage(named: "tick")
            }
            cell.dropDownlabel.text = dropDownListSearch[indexPath.row].name
        }else if dropDownType == .gender
        {
            if self.selectedDropDown != nil  &&  ((self.selectedDropDown?.id ?? "") == dropDownList[indexPath.row].id ?? ""){
                cell.img.image = UIImage(named: "tick")
            }
            cell.dropDownlabel.text = dropDownList[indexPath.row].name
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   dismiss(animated: true)
        if issearch {
            selectedDropDown = dropDownListSearch[indexPath.row]
           // didUpdateDropDown(dropDownType, dropDownListSearch[indexPath.row])
        }else {
            selectedDropDown = dropDownList[indexPath.row]
           // didUpdateDropDown(dropDownType, dropDownList[indexPath.row])
        }
        self.tableView.reloadData()
    }
}
