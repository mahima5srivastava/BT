//
//  Models.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import Foundation

/**
 "page": 1,
 "per_page": 6,
 "total": 12,
 "total_pages": 2,
 "data"
 */
struct CompleteData: Codable {
    var page: Int?
    var perPage: Int?
    var totalPages: Int?
    var data: [DataValue]?
    var total: Int?
    
    private enum CodingKeys : String, CodingKey {
        case page, data, total
        case totalPages = "total_pages"
        case perPage = "per_page"
        
    }
}

struct DataValue: Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    private enum CodingKeys : String, CodingKey {
        case id, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
}
