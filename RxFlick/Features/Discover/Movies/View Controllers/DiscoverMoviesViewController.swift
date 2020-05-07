//
//  DiscoverMoviesViewController.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class DiscoverMoviesViewController: UIViewController {
    let disposeBag: DisposeBag = .init()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupTabBar() {
        tabBarItem = .init(title: "Movies", image: HomeTab.movie.image, tag: HomeTab.movie.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let service = DiscoverMoviesAPIService()
        service.movies(atPage: 1)
            .compactMap({ $0.results })
            .bind(to: tableView.rx.items(cellIdentifier: "DefaultCell")) { (index, movie, cell) in
                cell.textLabel?.text = movie.title
        }.disposed(by: disposeBag)
    }
}
