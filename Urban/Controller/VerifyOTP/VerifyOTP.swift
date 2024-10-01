//
//  VerifyOTP.swift
//  Urban
//
//  Created by Zain on 28/08/2024.
//

import UIKit
import DPOTPView
protocol VerifyOTPDelegate : AnyObject {
    func close_tab(dialcode:String,number:String)
}
class VerifyOTP: UIViewController {
    
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var lblTimerText: UILabel!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var resendView: UIView!
    @IBOutlet weak var otpView: DPOTPView!

    weak var delegate : VerifyOTPDelegate?
    
    var mobile = ""
    var dialCode = ""
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberLbl.text = "\(dialCode)\(mobile)"
        resendView.isHidden = true
        runTimer()

        
        // Do any additional setup after loading the view.
    }
    @IBAction func closeNew(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
    @IBAction func changePressed(_ sender: UIButton) {
        self.dismiss(animated: true){
           
        }
    }
    @IBAction func confirmAction(_ sender: Any) {
        if otpView.validate()
        {
            OTPApi()

        }else
        {
            Utilities.showSuccessAlert(message: "Please enter valid otp")
        }
    }
    @IBAction func resendPressed(_ sender: Any) {
        if otpView.validate()
        {
            ResendOTPApi()

        }else
        {
            Utilities.showSuccessAlert(message: "Please enter valid otp")
        }
    }

    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        seconds -= 1
        if seconds == 0
        {
            timer.invalidate()
            lblTimerText.isHidden = true
            timerView.isHidden = true
            resendView.isHidden = false
        }
        lblTimerText.text = "0:\(seconds) sec"
    }

}
extension VerifyOTP  {
    
    func OTPApi() {
        var parameters:[String: String] = [
            "phone" :mobile,
            "otp": otpView.text ?? "",
            "dial_code":dialCode,
            "user_device_token":SessionManager.getFCMToken() ?? "",
            "user_device_type":deviceType,
            "device_cart_id":SessionManager.getCartId() ?? "",
            
        ]
        AuthenticationAPIManager.verifyOTPAPI( parameters: parameters) { response in
            switch response.status {
            case "1" :
                self.dismiss(animated: true){ [self] in
                    if response.data?.is_new_user ?? "" == "0"
                    {
                        Utilities.showSuccessAlert(message:response.message ?? "")
                        {
                            Coordinator.gotoTabbar()
                            SessionManager.setLoggedIn()
                        }
                    }else
                    {
                        self.delegate?.close_tab(dialcode:dialCode,number:mobile)
                    }
                }
                
            default :
                Utilities.showWarningAlert(message: response.message ?? "") {}
            }
        }
    }
    func ResendOTPApi() {
        let parameters:[String: String] = [
            "phone":mobile
        ]
        AuthenticationAPIManager.resendOTPAPI( parameters: parameters) { response in
            switch response.status {
            case "1" :
                
                Utilities.showSuccessAlert(message: response.message ?? "") {
                    self.otpView.text = ""
                    self.seconds = 60
                    self.lblTimerText.isHidden = false
                    self.timerView.isHidden = false
                    self.resendView.isHidden = true
                    self.runTimer()
                }
                
            default :
                
                Utilities.showWarningAlert(message: response.message ?? "") {}
            }
        }
    }
}
