//
//  GenericResponse.swift
//  ISHELF
//
//  Created by A2 MacBook Pro 2012 on 17/08/20.
//  Copyright © 2020 a2solution. All rights reserved.
//
import UIKit
import Foundation

struct GenericResponse : Codable {
    var message : String?
    var status : String?
    
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

struct GenericResponse2 : Codable {
    var message : String?
    var status : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }
}

struct DeliveryRepresentative {
    var userImg : UIImageView? = nil
    var driverName: String? = nil
    var residencyNo : String? = nil
    var dob : String? = nil
    var nationality :String? = nil
}

struct StartLive_Base : Codable {
    let status : String?
    let message : String?
    let oData : StartLive_Response?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"
    }
}
struct StartLive_Response : Codable {
    let story_id : String?
    enum CodingKeys: String, CodingKey {
        case story_id = "story_id"
    }
}

struct DropDownResponseModel: Codable {
    var status: String?
    var message: String?
    var oData: [DropDownData]?
}

// MARK: - ODatum
struct DropDownData: Codable {
    var id: String?
    var name: String?
}

struct PlaceOrderModel: Codable {
    var status: String?
    var message: String?
    var oData: PlaceOrderModelData?
}

// MARK: - ODatum
struct PlaceOrderModelData: Codable {
    var order_id: String?
    var order_no:String?
    
}

struct PaymentWallet : Codable {
    let message : String?
    let status : String?
    let oData : Payment?

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
        case oData = "oData"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        oData = try values.decodeIfPresent(Payment.self, forKey: .oData)
    }
}
struct Payment : Codable {
    let payment_ref : String?
    let invoice_id : String?
}




struct homeBase: Codable {
    var status, message: String?
    var oData: HomeOData?
}

// MARK: - OData
struct HomeOData: Codable {
    var banner: [Banner]?
    var categories: [Category]?
    var nearByOffers: [NearByOffer]?
    var socialData: SocialData?

    enum CodingKeys: String, CodingKey {
        case banner, categories
        case nearByOffers = "near_by_offers"
        case socialData = "social_data"
    }
}

// MARK: - SocialData
struct SocialData: Codable {
    var id, titleEn, titleAr, email: String?
    var mobile, descEn, descAr, location: String?
    var latitude, longitude: String?
    var twitter, instagram, facebook, youtube: String?
    var linkedin: String?
    var createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case titleEn = "title_en"
        case titleAr = "title_ar"
        case email, mobile
        case descEn = "desc_en"
        case descAr = "desc_ar"
        case location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
// MARK: - NearByOffer
struct NearByOffer: Codable {
    var outletID: String?
    var outletLogo: String?
    var couponTitle, couponID, couponDescription, couponCode: String?
    var couponAmount, amountType, name, latitude: String?
    var longitude, location: String?
    var image: String?
    var distance: String?

    enum CodingKeys: String, CodingKey {
        case outletID = "outlet_id"
        case outletLogo = "outlet_logo"
        case couponTitle = "coupon_title"
        case couponID = "coupon_id"
        case couponDescription = "coupon_description"
        case couponCode = "coupon_code"
        case couponAmount = "coupon_amount"
        case amountType = "amount_type"
        case name, latitude, longitude, location, image, distance
    }
}


// MARK: - Welcome
struct CategoryBase: Codable {
    var status, message: String?
    var oData: CategoryOData?
}
// MARK: - OData
struct CategoryOData: Codable {
    var banner: [Banner]?
    var categories: [Category]?
}

// MARK: - Banner
struct Banner: Codable {
    var id, bannerTitle: String?
    var bannerImage: String?
    var active, createdBy, updatedBy, createdAt: String?
    var updatedAt, categoryID, productID, type: String?
    var divisionID, outletID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case bannerTitle = "banner_title"
        case bannerImage = "banner_image"
        case active
        case createdBy = "created_by"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case categoryID = "category_id"
        case productID = "product_id"
        case type
        case divisionID = "division_id"
        case outletID = "outlet_id"
    }
}

// MARK: - Category
struct Category: Codable {
    var id, name: String?
    var image: String?
    var bannerImage, parentID, active, deleted: String?
    var sortOrder, createdUid, updatedUid, createdAt: String?
    var updatedAt, slug, divisionID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case bannerImage = "banner_image"
        case parentID = "parent_id"
        case active, deleted
        case sortOrder = "sort_order"
        case createdUid = "created_uid"
        case updatedUid = "updated_uid"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case slug
        case divisionID = "division_id"
    }
}


// MARK: - Offer Details
struct OfferDetailsBase: Codable {
    var status, message: String?
    var oData: OfferDetailsOData?
}

// MARK: - OData
struct OfferDetailsOData: Codable {
    var couponID, couponTitle, couponDescription, couponEndDate: String?
    var couponAmount, couponMinimumSpend, couponMaximumSpend, couponUsagePercoupon: String?
    var couponUsagePerx, couponUsagePeruser, couponCreatedDate, couponVenderID: String?
    var couponCode, couponStatus, individualUse, amountType: String?
    var createdAt, updatedAt, appliedTo, startDate: String?
    var minimumAmount: String?
    var image, policy: String?
    var otherDocuments, outletID, offerLabel: String?
    var outletLogo: String?
    var avgRating: String?
    var ratingDetails: [RatingDetail]?
    var isLiked: String?
    var youMayAlsoLike: [NearByOffer]?
    var qrCodeData: String?
    var shareLink: String?
    var isUsed: String?
    var outlet: outletData?
    var videos: [VideoElement]?
    var amounttype: Amounttype?

    enum CodingKeys: String, CodingKey {
        case couponID = "coupon_id"
        case couponTitle = "coupon_title"
        case couponDescription = "coupon_description"
        case couponEndDate = "coupon_end_date"
        case couponAmount = "coupon_amount"
        case couponMinimumSpend = "coupon_minimum_spend"
        case couponMaximumSpend = "coupon_maximum_spend"
        case couponUsagePercoupon = "coupon_usage_percoupon"
        case couponUsagePerx = "coupon_usage_perx"
        case couponUsagePeruser = "coupon_usage_peruser"
        case couponCreatedDate = "coupon_created_date"
        case couponVenderID = "coupon_vender_id"
        case couponCode = "coupon_code"
        case couponStatus = "coupon_status"
        case individualUse = "individual_use"
        case amountType = "amount_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case appliedTo = "applied_to"
        case startDate = "start_date"
        case minimumAmount = "minimum_amount"
        case image, policy
        case otherDocuments = "other_documents"
        case outletID = "outlet_id"
        case offerLabel = "offer_label"
        case outletLogo = "outlet_logo"
        case avgRating = "avg_rating"
        case ratingDetails = "rating_details"
        case isLiked = "is_liked"
        case youMayAlsoLike = "you_may_also_like"
        case qrCodeData = "qr_code_data"
        case shareLink = "share_link"
        case isUsed = "is_used"
        case outlet, videos, amounttype
    }
}

// MARK: - Amounttype
struct Amounttype: Codable {
    var id, name: String?
}

struct outletData: Codable {
    var id, name,user_image,banner_image,location: String?
}

// MARK: - RatingDetail
struct RatingDetail: Codable {
    var id, name, userID, serviceID: String?
    var rating, title, comment, createdAt: String?
    var orderID: String?
    var userImage: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case userID = "user_id"
        case serviceID = "service_id"
        case rating, title, comment
        case createdAt = "created_at"
        case orderID = "order_id"
        case userImage = "user_image"
    }
}

// MARK: - VideoElement
struct VideoElement: Codable {
    var id, couponID, videoID, sortOrder: String?
    var is_viewed :String?
    var createdAt, updatedAt: String?
    var videoURL: String?
    var video: VideoVideo?

    enum CodingKeys: String, CodingKey {
        case id
        case couponID = "coupon_id"
        case videoID = "video_id"
        case sortOrder = "sort_order"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case videoURL = "video_url"
        case is_viewed
        case video
    }
}

// MARK: - VideoVideo
struct VideoVideo: Codable {
    var id, vendorID: String?
    var video: String?
    var active, deleted, createdAt, updatedAt: String?
    var videoType, videoTitle: String?

    enum CodingKeys: String, CodingKey {
        case id
        case vendorID = "vendor_id"
        case video, active, deleted
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case videoType = "video_type"
        case videoTitle = "video_title"
    }
}


// MARK: - Category Coupons
struct CategoryByCouponBase: Codable {
    var status, message: String?
    var oData: CategoryByCouponOData?
}
// MARK: - OData
struct CategoryByCouponOData: Codable {
    let list: [NearByOffer]?
}

// MARK: - Favourite Store
struct FavoutiteBase: Codable {
    var status, message: String?
    var oData: FavoutiteOData?
}

// MARK: - OData
struct FavoutiteOData: Codable {
    var favourites: [Favourite]?
}

// MARK: - Favourite
struct Favourite: Codable {
    var id, name: String?
    var userImage: String?
    var location,about_me, latitude, longitude, isLiked: String?
    var rating, coupons: String?

    enum CodingKeys: String, CodingKey {
        case id, name,about_me
        case userImage = "user_image"
        case location, latitude, longitude
        case isLiked = "is_liked"
        case rating, coupons
    }
}


// MARK: - Welcome
struct StoreDetailsBase: Codable {
    var status, message: String?
    let oData: StoreDetailsOData?
}

// MARK: - OData
struct StoreDetailsOData: Codable {
    var outlet: OutletData?
    var list: [NearByOffer]?
}
// MARK: - Outlet
struct OutletData: Codable {
    var id: Int?
    var name: String?
    var userImage: String?
    var location, latitude, longitude, aboutMe: String?
    var isLiked, rating, coupons: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case userImage = "user_image"
        case location, latitude, longitude
        case aboutMe = "about_me"
        case isLiked = "is_liked"
        case rating, coupons
    }
}


struct CMSModel : Codable {
    let status : String?
    let message : String?
    let oData : CMSOData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case oData = "oData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        oData = try values.decodeIfPresent(CMSOData.self, forKey: .oData)
    }

}

struct CMSOData : Codable {
    let id : Int?
    let title : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title_en"
        case description = "desc_en"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}

struct FAQListBase: Codable {
    var status: String?
    var message: String?
    var oData: [FAQListItem]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case oData = "oData"
    }
}


// MARK: - ODatum
struct FAQListItem: Codable {
    var id, title, description, createdBy: String
        var updatedBy, active, createdAt, updatedAt: String

        enum CodingKeys: String, CodingKey {
            case id, title, description
            case createdBy = "created_by"
            case updatedBy = "updated_by"
            case active
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
}



struct OutLetOrdersDetails_base: Codable {
    var status: String?
    var message: String?
    var oData: OutLetOrdersDetails?
}
// MARK: - Welcome
struct OutLetOrders_base: Codable {
    var status: String?
    var message: String?
    var oData: [OutLetOrdersODatum]?
}

// MARK: - ODatum
struct OutLetOrdersODatum: Codable {
    var id, orderNo, customerID, outletID: String?
    var couponID, orderDate, createdAt, updatedAt: String?
    var couponCode: String?
    var earned, status: String?
    var customerLocation: String?
    var couponDetails: CouponDetails?
    var customerName:String?
   // var customer: User?

    enum CodingKeys: String, CodingKey {
        case id
        case orderNo = "order_no"
        case customerID = "customer_id"
        case outletID = "outlet_id"
        case couponID = "coupon_id"
        case orderDate = "order_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case couponCode = "coupon_code"
        case earned, status
        case customerLocation = "customer_location"
        case couponDetails = "coupon_details"
       case customerName
    }
}

// MARK: - ODatum
struct OutLetOrdersDetails: Codable {
    var id, orderNo, customerID, outletID: String?
    var couponID, orderDate, createdAt, updatedAt: String?
    var couponCode: String?
    var earned, status: String?
    var customerLocation: String?
    var couponDetails: CouponDetails?
    var customerName:String?
    var customer: User?
    var coupon_amount_type:String?
    var coupon_code:String?
    var coupon_discount_value:String?
    var coupon_id:String?
    var coupon_sub_title:String?
    var coupon_sub_title_ar:String?
    var saved_amount:String?
    var original_price:String?


    enum CodingKeys: String, CodingKey {
        case id
        case orderNo = "order_no"
        case customerID = "customer_id"
        case outletID = "outlet_id"
        case couponID = "coupon_id"
        case orderDate = "order_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case couponCode = "coupon_code"
        case earned, status
        case customerLocation = "customer_location"
        case couponDetails = "coupon_details"
        case customer
       case customerName
        case coupon_amount_type,coupon_discount_value,coupon_sub_title,coupon_sub_title_ar
        case saved_amount
        case original_price
    }
}


// MARK: - CouponDetails
struct CouponDetails: Codable {
    var couponID, couponTitle: String?
    var couponDescription: String?
    var couponEndDate, couponAmount, couponMinimumSpend, couponMaximumSpend: String?
    var couponUsagePercoupon, couponUsagePerx, couponUsagePeruser, couponCreatedDate: String?
    var couponVenderID: String?
    var couponCode: String?
    var couponStatus, individualUse, amountType, createdAt: String?
    var updatedAt, appliedTo: String?
    var startDate: String?
    var minimumAmount: String?
    var image: String?
    var policy: String?
    var otherDocuments, outletID, offerLabel: String?
    var saved_price:String?
    var coupon_price:String?
    var coupon_discount_value:String?
    var coupon_sub_title:String?
    var max_price:String?
    var min_price:String?

    enum CodingKeys: String, CodingKey {
        case couponID = "coupon_id"
        case couponTitle = "coupon_title"
        case couponDescription = "coupon_description"
        case couponEndDate = "coupon_end_date"
        case couponAmount = "coupon_amount"
        case couponMinimumSpend = "coupon_minimum_spend"
        case couponMaximumSpend = "coupon_maximum_spend"
        case couponUsagePercoupon = "coupon_usage_percoupon"
        case couponUsagePerx = "coupon_usage_perx"
        case couponUsagePeruser = "coupon_usage_peruser"
        case couponCreatedDate = "coupon_created_date"
        case couponVenderID = "coupon_vender_id"
        case couponCode = "coupon_code"
        case couponStatus = "coupon_status"
        case individualUse = "individual_use"
        case amountType = "amount_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case appliedTo = "applied_to"
        case startDate = "start_date"
        case minimumAmount = "minimum_amount"
        case image, policy
        case otherDocuments = "other_documents"
        case outletID = "outlet_id"
        case offerLabel = "offer_label"
        case saved_price
        case coupon_price
        case coupon_discount_value
        case coupon_sub_title
        case max_price
        case min_price


    }
}
