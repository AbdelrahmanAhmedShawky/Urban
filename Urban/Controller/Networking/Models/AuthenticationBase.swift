//
//  LoginResponse.swift
//  Fast_Time
//
//  Created by Muhammad Junaid Babar on 15/02/2023.
//

import Foundation

import Foundation

// MARK: - Welcome
struct Authentication_Base: Codable {
    let status, message, accessToken, tokenType: String?
    let expiresAt, firebaseUserKey: String?
    let data: User?
    let is_new_user:String?
    
    enum CodingKeys: String, CodingKey {
        case status, message
        case accessToken = "token"
        case tokenType = "token_type"
        case expiresAt = "expires_at"
        case firebaseUserKey = "firebase_user_key"
        case data
        case is_new_user
    }
}
struct Register_Base: Codable {
    let status, message:String?
    let data: Register_Data?
    
    enum CodingKeys: String, CodingKey {
        case status, message
        case data
    }
}
struct Register_Data : Codable {
    let is_new_user:String?
    let token:String?
    let user: User?

}
struct GeneralResponseModel : Codable {
    let status : String?
    let message : String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
         
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}


struct ForgotPassModel : Codable {
    var status : String?
    var message : String?
    var oData: ForgotPassModelData?


    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"

    }

}
struct ForgotPassModelData : Codable {
    
    var password_reset_code : String?
    
    enum CodingKeys: String, CodingKey {
        case password_reset_code
    }

}
struct supportModel : Codable {
    let status : String?
    let message : String?
    let oData: supportModelData?


    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"

    }

}
struct supportModelData : Codable {
    
    let support_mail : String?
    
    enum CodingKeys: String, CodingKey {
        case support_mail
    }

}
struct ForgotOTPModel : Codable {
    let status : String?
    let message : String?
    let oData: ForgotOTPModelData?


    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"

    }

}
struct ForgotOTPModelData : Codable {
    
    let user_id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case user_id
    }

}
struct CountryListModel : Codable {
    let status : String?
    let message : String?
    let oData: [CountryListModelData]?


    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"

    }

}
struct CountryListModelData : Codable {

    let id : String?
    let name : String?
    let prefix : String?
    let dial_code : String?
    let image : String?

    enum CodingKeys: String, CodingKey {
        
        case id,name,prefix,dial_code,image
    }

}
class NotificationModel: Codable {
    var key : String?
    var title : String?
    var orderId : String?
    var description : String?
    var notificationType : String?
    var read : String?
    var seen : String?
    var createdAt : String?
    var imageURL : String?
    var url : String?
    var enquiryType : String?
    var createdDate : String?
    var coupon_id :String?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case title = "title"
        case orderId = "orderId"
        case description = "description"
        case notificationType = "notificationType"
        case read = "read"
        case seen = "seen"
        case createdAt = "createdAt"
        case imageURL = "imageURL"
        case url = "url"
        case enquiryType = "enquiryType"
        case createdDate,coupon_id

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        orderId = try values.decodeIfPresent(String.self, forKey: .orderId)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        notificationType = try values.decodeIfPresent(String.self, forKey: .notificationType)
        read = try values.decodeIfPresent(String.self, forKey: .read)
        seen = try values.decodeIfPresent(String.self, forKey: .seen)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        enquiryType = try values.decodeIfPresent(String.self, forKey: .enquiryType)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        coupon_id = try values.decodeIfPresent(String.self, forKey: .coupon_id)

    }
}



