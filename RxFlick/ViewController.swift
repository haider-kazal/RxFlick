//
//  ViewController.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 20/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController {
    let disposableBag: DisposeBag = .init()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (second) in
                self?.label.text = "\(second)"
            })
            .disposed(by: disposableBag)
    }
}

