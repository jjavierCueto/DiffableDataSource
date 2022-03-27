//
//  ItemViewModel.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
//

import UIKit.UIFont
// mvc : model view controlador
// modelo
// vista
// controlador
struct ItemViewMModel: Hashable {
    
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    private var titleFontAttributes: [NSAttributedString.Key : Any] {
        return [
            .font : UIFont.systemFont(ofSize: 15, weight: .semibold),
            .foregroundColor : UIColor.darkText
        ]
    }
    
    private var priceFontAttributes: [NSAttributedString.Key : Any] {
        return [
            .font : UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor : UIColor.systemGray2
        ]
    }
    
    var titleAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: item.title, attributes: titleFontAttributes)
    }
    
    var priceAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: itemPrice, attributes: priceFontAttributes)
    }
    
    var rating: Int {
        return item.rating
    }
    
    private var itemPrice: String {
        return numberFormatter.string(from: item.price as NSNumber) ?? "0.0"
    }
    
    private var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }
}
