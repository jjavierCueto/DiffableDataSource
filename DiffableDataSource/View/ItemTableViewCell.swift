//
//  ItemTableViewCell.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 15/03/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "title-label-item.cell"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "price-label-item.cell"
        return label
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "emoji-label-item.cell"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViewForRating(_ rating: Int) {
        switch rating {
        case 0...2: emojiLabel.text = "☹️"
        case 2, 3: emojiLabel.text = "😕"
        case 4: emojiLabel.text = "🙂"
        case 5: emojiLabel.text = "☺️"
        default:
            fatalError("Error updating emoji label for rating: \(rating)")
        }
    }
    
    private func layoutViews() {
        [titleLabel, priceLabel, emojiLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            emojiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
