//
//  ItemsViewModel.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation

class GrovceriesViewModel {
    
    private let repository = GroceriesReposiroty()
    
    init() {}
    
    private(set) var groceries: Box<[ItemViewMModel]> = Box(value: [])
    
    func getGroceries() {
        let result = repository.getGroceriesList()
        
        switch result {
        case .success(let items):
            groceries.value = items.map { ItemViewMModel(item: $0) }
        case .failure(let error):
            print(error)
        }
    }
}
