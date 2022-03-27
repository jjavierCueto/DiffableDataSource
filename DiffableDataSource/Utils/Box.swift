//
//  Box.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: Listener?
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
