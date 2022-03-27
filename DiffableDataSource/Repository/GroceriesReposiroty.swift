//
//  GroceriesReposiroty.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation

struct GroceriesReposiroty {
    
    typealias ItemsResult = Result<[Item], ItemRepositoryError>
    
    enum ItemRepositoryError: Error {
        case unreachable
        case data
        case unreadable
    }
    
    func getGroceriesList() -> ItemsResult {
        guard let url = Bundle.main.url(forResource: "groceries", withExtension: "json") else {
            return .failure(.unreachable)
        }
        
        guard let data = try? Data(contentsOf: url) else { return .failure(.data) }
        
        let decoder = JSONDecoder()
        
        if let items = try? decoder.decode([Item].self, from: data) {
            return .success(items)
        }
        return .failure(.unreadable)
    }
}

