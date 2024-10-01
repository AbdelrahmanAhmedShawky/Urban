//
//  LoginVC.swift
//  Urban
//
//  Created by Zain on 28/08/2024.
//

import UIKit
import CountryPickerView

protocol LoginVCDelegate : AnyObject {
    func close()
}
class LoginVC: UIViewController, VerifyOTPDelegate {
    func close_tab(dialcode: String, number: String) {
        self.dismiss(animated: true) { [weak self] in
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name("otpsuccess"), object: nil, userInfo: ["dialcode": dialcode, "number": number])
                }
            }
    }
    
  
    
    
    @IBOutlet weak var mobileNumberTxt: UITextField!
    @IBOutlet weak var dialCodeTxt: UILabel!
    @IBOutlet weak var dialCodeImg: UIImageView!

    weak var delegate : LoginVCDelegate?
    
    let cpvInternal = CountryPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()

        mobileNumberTxt.delegate = self

    }
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true){
           // self.delegate?.close()
        }
    }

    @IBAction func confirmAction(_ sender: Any) {
        if isValidForm()
        {
            loginAPi()
        }
    }
    @IBAction func countryCodeAction(_ sender: Any) {
        cpvInternal.delegate = self
        cpvInternal.showCountriesList(from: self)
    }
}
extension LoginVC {
    func loginAPi() {
        let parameters:[String:String] = [
            "phone" : mobileNumberTxt.text ?? "",
            "dial_code" : dialCodeTxt.text ?? "",
        ]
        AuthenticationAPIManager.loginAPI(parameters: parameters) { result in
            switch result.status {
            case "1" :
                Utilities.showSuccessAlert(message: result.message ?? "")
                {
                    
                    self.presentOTP()
                }
            default:
                Utilities.showWarningAlert(message: result.message ?? "")
                
            }
        }
    }
    func presentOTP()
    {
        let vc = Storyboard.intro.instance.instantiateViewController(withIdentifier: "VerifyOTP") as! VerifyOTP
        vc.delegate = self
        vc.dialCode = dialCodeTxt.text ?? ""
        vc.mobile = mobileNumberTxt.text ?? ""
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
extension LoginVC:UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 12
    }
}
extension LoginVC: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.dialCodeTxt.text = country.phoneCode
        self.dialCodeImg.image = country.flag
    }
}
extension LoginVC {
    func isValidForm() -> Bool {
        if mobileNumberTxt.text?.trimmingCharacters(in: .whitespaces) == "" {
            Utilities.showWarningAlert(message: "Please enter mobile number") {
                
            }
            return false
        }
        return true
    }
}
