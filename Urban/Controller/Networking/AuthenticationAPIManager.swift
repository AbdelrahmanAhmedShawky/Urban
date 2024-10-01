//
//  AuthenticationAPIManager.swift
//  Maharani
//
//  Created by Albin Jose on 12/01/22.
//

import Foundation
import Alamofire


class AuthenticationAPIManager {
    /// Simple login
    struct LoginConfig: APIConfiguration {
        var parameters: [String : String] = [:]
        var method: HTTPMethod = .post
        var path = "login_otp"
    }
    
    public class func loginAPI(parameters: [String: String], completionHandler : @escaping(_ result: Authentication_Base) -> Void) {
        var config = LoginConfig()
        config.parameters = parameters
        APIClient.apiRequest(request: config) { (result) in
            do {
                let json = try JSONSerialization.data(withJSONObject: result as Any)
                let response = try JSONDecoder().decode(Authentication_Base.self, from: json)
                switch response.status {
                case "1":
                    guard let dict = result?["data"] as? [String:Any] else { return }
                    SessionManager.setUserData(dictionary: dict)
                    UserDefaults.standard.set(nil, forKey: "googleImage")
                    NotificationCenter.default.post(name: Notification.Name("loginStatusChanged"), object: nil)
                default:
                    break
                }
                completionHandler(response)
            } catch let err {
                print(err)
                if let resDIc =  result{
                    Utilities.showWarningAlert(message: resDIc["message"] as? String ?? "Unknow error occured")
                }else{
                    Utilities.showWarningAlert(message: "Unknow error occured")
                }
            }
        }
    }
   
    
    struct verifyOTPConfig: APIConfiguration {
        var parameters: [String : String] = [:]
        var method: HTTPMethod = .post
        var path = "verify_otp"
    }
    
    public class func verifyOTPAPI(parameters: [String: String], completionHandler : @escaping(_ result: Register_Base) -> Void) {
        var config = verifyOTPConfig()
        config.parameters = parameters
        APIClient.apiRequest(request: config) { (result) in
            do {
                let json = try JSONSerialization.data(withJSONObject: result as Any)
                let response = try JSONDecoder().decode(Register_Base.self, from: json)
                switch response.status {
                case "1":
                    guard var dict = result?["data"] as? [String:Any] else { return }
                    guard let data = dict["user"] as? [String:Any] else { return }
                    dict["token"] = response.data?.token ?? ""
                    SessionManager.setUserData(dictionary: data)
                    SessionManager.setUserAccessToken(token: response.data?.token ?? "")
                default:
                    break
                }
                completionHandler(response)
            } catch let err {
                print(err)
                if let resDIc =  result{
                    Utilities.showWarningAlert(message: resDIc["message"] as? String ?? "Unknow error occured")
                }else{
                    Utilities.showWarningAlert(message: "Unknow error occured")
                }
            }
        }
    }
    struct ResendOTPConfig: APIConfiguration {
        var parameters: [String : String] = [:]
        var method: HTTPMethod = .post
        var path = "resend_otp"
    }
    public class func resendOTPAPI(parameters: [String: String], completionHandler : @escaping(_ result: GeneralResponseModel) -> Void) {
        var config = ResendOTPConfig()
        config.parameters = parameters
        APIClient.apiRequest(request: config) { (result) in
            do {
                let json = try JSONSerialization.data(withJSONObject: result as Any)
                let response = try JSONDecoder().decode(GeneralResponseModel.self, from: json)
                completionHandler(response)
            } catch let err {
                print(err)
            }
        }
    }
    struct registerApiConfig : UploadAPIConfiguration {
        var documents: [String : [UploadMedia?]]
        var uploadImages: [BBMedia]
        var images: [String : [UIImage?]]
        var parameters: [String : String] = [:]
        var method: HTTPMethod = .post
        var path = "register"
    }
   
    class func registerAPI(images:[String : [UIImage?]], parameters: [String: String], completionHandler: @escaping(_ result: Register_Base) -> Void) {
        var config = registerApiConfig(
            documents: [ : ], uploadImages: [],
            images : images
        )
        config.parameters = parameters
        APIClient.multiPartRequest(request: config) { result in
            do {
                let json = try JSONSerialization.data(withJSONObject: result as Any)
                let response = try JSONDecoder().decode(Register_Base.self, from: json)
                print(response)
                guard var dict = result?["data"] as? [String:Any] else { return }
                guard let data = dict["user"] as? [String:Any] else { return }
                dict["token"] = response.data?.token ?? ""
                SessionManager.setUserData(dictionary: data)
                SessionManager.setUserAccessToken(token: response.data?.token ?? "")
                SessionManager.setLoggedIn()
                completionHandler(response)
            } catch let err {
                print(err)
            }
        }
    }
    
   
}

