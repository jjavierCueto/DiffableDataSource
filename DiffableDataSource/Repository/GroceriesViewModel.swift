//
//  ItemsViewModel.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation
import RxSwift
import RxRelay

final class GroceriesViewModel {
    
    private let repository = GroceriesRepository()
    
    init() {}
        
    func getGroceries() -> Observable<[ItemViewMModel]> {
		repository.groceriesDataSource.map { $0.map{ ItemViewMModel(item: $0) } } .asObservable()
    }
}
