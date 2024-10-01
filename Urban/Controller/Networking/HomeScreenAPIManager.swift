//
//  HomeScreenAPIManager.swift
//  Urban
//
//  Created by MAC on 01/10/24.
//

import Foundation
import Alamofire

class HomeScreenAPIManager {
    
    
    // MARK: - API Configuration
    struct HomeConfig: APIConfiguration {
        var parameters: [String : String] = [:]
        var method: HTTPMethod = .get
        var path = "home"
    }
    

    // MARK: - Fetch Home Data
    public class func fetchHomeData(completionHandler: @escaping (_ result: HomeResponse?) -> Void) {
        let config = HomeConfig()
        APIClient.apiRequest(request: config) { (result) in
            do {
                let json = try JSONSerialization.data(withJSONObject: result as Any)
                let response = try JSONDecoder().decode(HomeResponse.self, from: json)
                completionHandler(response)
            } catch {
                print("Error decoding home data: \(error)")
                completionHandler(nil)
            }
        }
    }
}


