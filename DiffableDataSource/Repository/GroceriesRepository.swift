//
//  GroceriesRepository.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation
import RxSwift

struct GroceriesRepository {
        
    enum ItemRepositoryError: Error {
        case data
		case decodingFailed
		case fileNotFound
    }
	private var subject = BehaviorSubject<[Item]>(value: [])
	
	public var groceriesDataSource: Observable<[Item]>  {
		subject.asObservable()
	}
	
	init(){
		getGroceriesList()
	}
    private func getGroceriesList() {
        guard let url = Bundle.main.url(forResource: "groceries", withExtension: "json") else {
			return subject.onError(ItemRepositoryError.fileNotFound)
        }
        
		guard let data = try? Data(contentsOf: url) else { return subject.onError(ItemRepositoryError.data)}
        
        let decoder = JSONDecoder()
        
        if let items = try? decoder.decode([Item].self, from: data) {
			return subject.onNext(items)
        }
        return subject.onError(ItemRepositoryError.decodingFailed)
    }
}

