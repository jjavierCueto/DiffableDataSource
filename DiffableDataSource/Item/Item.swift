//
//  Item.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation

struct Item: Decodable {
    var title: String
    var type: String
    var description: String
    var filename: String
    var height: Int
    var width: Int
    var price: Double
    var rating: Int
}

extension Item: Hashable {}
