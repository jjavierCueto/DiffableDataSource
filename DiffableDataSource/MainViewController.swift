//
//  MainViewController.swift
//  DiffableDataSource
//
//  Created by Osmar Hernandez on 12/03/22.
// RXswift

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: UIViewController {
    
	private let disposeBag = DisposeBag()

    private var viewModel: GroceriesViewModel?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60
        return tableView
    }()
    
    
    convenience init(title: String) {
        self.init()
        navigationItem.title = title
        viewModel = GroceriesViewModel()
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
        bind()
    }
    
    private func bind() {
		viewModel?.getGroceries().bind(to: tableView.rx.items(cellIdentifier: ItemTableViewCell.reuseIdentifier, cellType: ItemTableViewCell.self)) { (_, model, itemCell) in
			itemCell.titleLabel.attributedText = model.titleAttributedString
			itemCell.priceLabel.attributedText = model.priceAttributedString
			itemCell.updateViewForRating(model.rating)
		}.disposed(by: disposeBag)
			
    }
}
