import Foundation

struct HomeResponse: Codable {
    let status: String
    let message: String
    let data: HomeData
    let errors: [String: String]?
    let error: String?
}

struct HomeData: Codable {
    let sliderData: [SliderData]
    let services: [Service]
    let categories: [Categorys]
    let bannerData: [BannerData]
    let mostBookedServices: [Service]
    let servicesByCategory: [ServiceByCategory]

    enum CodingKeys: String, CodingKey {
        case sliderData = "slider_data"
        case services
        case categories
        case bannerData = "banner_data"
        case mostBookedServices = "most_booked_services"
        case servicesByCategory = "services_by_category"
    }
}

struct SliderData: Codable {
    let id: String
    let image: String
    let link: String?
    let title: String?
    let description: String?
}

struct Service: Codable {
    let id: String
    let title: String
    let image: String
    let price: Price
    let subCateYes: String

    enum CodingKeys: String, CodingKey {
        case id, title, image, price
        case subCateYes = "sub_cate_yes"
    }
}

struct Categorys: Codable {
    let id: String
    let title: String
    let image: String
    let subCateYes: String

    enum CodingKeys: String, CodingKey {
        case id, title, image
        case subCateYes = "sub_cate_yes"
    }
}

struct BannerData: Codable {
    let id: String
    let image: String
    let shortDescription: String?
    let title: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, image
        case shortDescription = "short_description"
        case title, type
    }
}

struct MostBookedService: Codable {
    let id: String
    let title: String
    let price: Price
    let image: String
    let subCateYes: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, image
        case subCateYes = "sub_cate_yes"
    }
}

struct Price: Codable {
    let value: String

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            self.value = String(intValue)
        } else {
            self.value = try container.decode(String.self)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let intValue = Int(value) {
            try container.encode(intValue)
        } else {
            try container.encode(value)
        }
    }
}

struct ServiceByCategory: Codable {
    let id: String
    let position: String
    let userId: String
    let parentId: String
    let addonId: String?
    let slug: String
    let name: String
    let thumbnailImg: String
    let price: Price
    let materialStatus: String
    let materialPrice: Double
    let recommended: String?
    let status: String
    let createdAt: String
    let updatedAt: String
    let featured: String
    let featuredBanner: String?
    let shortDescription: String?
    let description: String?
    let metaTitle: String?
    let metaDescription: String?
    let canonical: String?
    let umCommission: String?

    enum CodingKeys: String, CodingKey {
        case id, position
        case userId = "user_id"
        case parentId = "parent_id"
        case addonId = "addon_id"
        case slug, name
        case thumbnailImg = "thumbnail_img"
        case price
        case materialStatus = "material_status"
        case materialPrice = "material_price"
        case recommended, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case featured, featuredBanner = "featured_banner"
        case shortDescription = "short_description"
        case description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case canonical
        case umCommission = "um_commission"
    }
}
