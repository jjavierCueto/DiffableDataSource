//
//  ItemsViewModel.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation
import RxSwift
import RxRelay

class GroceriesViewModel {
    
    private let repository = GroceriesReposiroty()
    
    init() {}
    
	private(set) var groceries: BehaviorRelay<[ItemViewMModel]> = BehaviorRelay.init(value: [])
    
    func getGroceries() {
        let result = repository.getGroceriesList()
        
        switch result {
        case .success(let items):
			groceries.accept( items.map { ItemViewMModel(item: $0) })
        case .failure(let error):
            print(error)
        }
    }
}
