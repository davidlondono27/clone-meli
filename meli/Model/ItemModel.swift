//
//  ItemModel.swift
//  meli
//
//  Created by David Londoño on 10/07/22.
//

import Foundation

//MARK: Main Model for Item
struct MainItem : Decodable {
    var id : String
    var title : String
    var price : Int
    var pictures : [ItemPictures]
    var tags : [String]
    var condition : String
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case price
        case pictures
        case tags
        case condition
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Int.self, forKey: .price)
        self.pictures = try container.decode([ItemPictures].self, forKey: .pictures)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.condition = try container.decode(String.self, forKey: .condition)
    }
}

//Pictures
struct ItemPictures : Decodable {
    var id : String
    var url : String
    
    enum CondingKeys : String, CodingKey {
        case id
        case url = "secure_url"
    }
}

//Description from Plain Text
struct ItemDescription : Decodable {
    var description : String
    
    enum CodingKeys : String, CodingKey {
    case description = "plain_text"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
