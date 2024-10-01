//
//  RegisterVC.swift
//  Urban
//
//  Created by Zain on 28/08/2024.
//

import UIKit
import DatePickerDialog
class RegisterVC: BaseViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var dobTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var refferelTxt: UITextField!

    @IBOutlet weak var userImg: UIImageView!

    var imagePicker: ImagePicker!
    var selectedImage: UIImage?
    
    var genderArray: [DropDownData] = [DropDownData(id: "1", name: "Male"),DropDownData(id: "2", name: "Female")]
    var selectedGender: DropDownData?


    var dialCode = ""
    var mobile = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerTitle = "Register"
        type = .myProfile
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        
    }
    @IBAction func chooseLoc(_ sender: UIButton) {
        if isValidForm()
        {
            registerAPI()
        }
    }
    @IBAction func dobPressed(_ sender: UIButton) {
        datePickerTapped()
    }
    @IBAction func genderPressed(_ sender: UIButton) {
        self.openGenderDropDown()

    }

    @IBAction func editImagePressed(_ sender: Any) {
        self.imagePicker.present(from: self.view)
    }
    func datePickerTapped() {
        DatePickerDialog().show("Select DOB", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate:Date(),datePickerMode: .date) { date in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                self.dobTxt.text = formatter.string(from: dt)
            }
        }
    }
    fileprivate func openGenderDropDown() {
        let dropDownVC = Storyboard.home.instance.instantiateViewController(withIdentifier: "DropDownListVC") as! DropDownListVC
        dropDownVC.modalPresentationStyle = .overFullScreen
        dropDownVC.dropDownList = genderArray
        dropDownVC.dropDownType = .gender
        dropDownVC.selectedType = "Select Gender"
        dropDownVC.selectedDropDown = selectedGender
        dropDownVC.didUpdateDropDown = { [weak self] _, dropDownData in
            guard let self = self else { return }
            self.selectedGender = dropDownData
            self.genderTxt.text = dropDownData.name
        }
        self.present(dropDownVC, animated: true, completion: nil)
    }


}
extension RegisterVC: ImagePickerDelegate {
  
    func didSelect(image: UIImage?, fileName: String, fileSize: String) {
        if(image != nil){
        self.selectedImage = image
        self.userImg.image = image
        }
    }
    
}
extension RegisterVC
{
    func registerAPI() {
       let cleanedDialCode = dialCode.removePlusFromDialCode(dialCode)
        let parameters:[String:String] = [
            "phone" : mobile,
            "role" : "customer",
            "dial_code" :dialCode,
            "email" : emailTxt.text ?? "",
            "name" : self.nameTxt.text ?? "",
            "DOB" : self.dobTxt.text ?? "",
            "gender" : self.genderTxt.text ?? "",
            
        ]
       print(parameters)
        
       let userFile:[String:[UIImage?]] = ["profile" :[selectedImage]]
       AuthenticationAPIManager.registerAPI(images:userFile, parameters: parameters) { result in
           switch result.status {
           case "1":
               Coordinator.goToChooseLocation(delegate: self)
           default:
               Utilities.showWarningAlert(message: result.message ?? "") {
                   
               }
           }
       }
   }
    func isValidForm() -> Bool {
        if nameTxt.text?.trimmingCharacters(in: .whitespaces) == "" {
            Utilities.showWarningAlert(message: "Please enter name") {
                
            }
            return false
        }
        if emailTxt.text?.trimmingCharacters(in: .whitespaces) == "" {
            Utilities.showWarningAlert(message: "Please enter E-Mail") {
                
            }
            return false
        }
        if !(emailTxt.text?.isValidEmail() ?? false) {
            Utilities.showWarningAlert(message: "Please enter valid E-Mail") {
                
            }
            return false
        }
        if dobTxt.text?.trimmingCharacters(in: .whitespaces) == "" {
            Utilities.showWarningAlert(message: "Please enter dob") {
                
            }
            return false
        }
        return true
    }
}
