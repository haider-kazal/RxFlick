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
        let a = DiscoverMoviesAPIService().movies(atPage: 1).subscribe(onNext: { (result) in
            print(result)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("Completed")
        }, onDisposed: {
            print("Disposed")
        })
        a.disposed(by: disposeBag)
    }
}
