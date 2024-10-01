//
//  User.swift
//  Maharani
//
//  Created by Albin Jose on 12/01/22.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id, name, email, otp: String?
    let phone, gender, dob: String?
    let profile: String?
    let isActive, isRegistered, role, registeredBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, otp, phone, gender
        case dob = "DOB"
        case profile
        case isActive = "is_active"
        case isRegistered = "is_registered"
        case role
        case registeredBy = "registered_by"
    }
}
