//
//  HomeViewController.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    private lazy var movieViewController: DiscoverMoviesViewController = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [movieViewController]
        hidesBottomBarWhenPushed = false
    }
}
