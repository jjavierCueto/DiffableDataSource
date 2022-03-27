//
//  MainViewController.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
// RXswift

import UIKit

class MainViewController: UIViewController {
    
    typealias ItemViewModelDataSource = UITableViewDiffableDataSource<Int, ItemViewMModel>

    private var viewModel: GrovceriesViewModel?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60
        return tableView
    }()
    
    
    private lazy var dataSource: ItemViewModelDataSource = {
        let dataSource = ItemViewModelDataSource(tableView: tableView) { tableView, indexPath, model -> UITableViewCell in
            guard let itemCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifier, for: indexPath) as? ItemTableViewCell else { assert(false) }
            itemCell.titleLabel.attributedText = model.titleAttributedString
            itemCell.priceLabel.attributedText = model.priceAttributedString
            itemCell.updateViewForRating(model.rating)
            return itemCell
        }
        return dataSource
    }()
    
    convenience init(title: String) {
        self.init()
        navigationItem.title = title
        viewModel = GrovceriesViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getGroceries()
        bind()
    }
    
    private func bind() {
        viewModel?.groceries.bind {  items in
			var snapshot = self.dataSource.snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(items, toSection: 0)
			self.dataSource.apply(snapshot)
        }
    }
}
