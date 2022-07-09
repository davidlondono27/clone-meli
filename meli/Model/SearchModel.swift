//
//  SearchModel.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import Foundation

//MARK: Main response data get from API
struct MainResult: Decodable {
    var total_Products : TotalProducts
    var products : [Product]
    
    enum CodingKeys: String, CodingKey {
        case total_Products = "paging"
        case products = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total_Products = try container.decode(TotalProducts.self, forKey: .total_Products)
        self.products = try container.decode([Product].self, forKey: .products)
    }
}

//MARK: General Products List
struct TotalProducts : Decodable {
    var total: Int
    
    enum CodingKeys: String, CodingKey {
        case total
    }
}

//MARK: Product Detail Model
struct Product : Decodable {
    var id : String
    var title : String
    var price : Int
    var image : String
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case price
        case image = "thumbnail"
    }
}
