//
//  Cat.swift
//  CatApp
//
//  Created by Sebastian Koller on 11.05.24.
//

import Foundation

struct CatImage: Decodable {
    let id: String
    let width: Int
    let height: Int
    let url: String
}

struct Cat: Decodable, Identifiable {
    let id: String
    let name: String
    let description: String
    let imageUrl: CatImage?
    
    enum CodingKeys: String, CodingKey {
           case id, name, description, imageUrl = "image"
       }
}

