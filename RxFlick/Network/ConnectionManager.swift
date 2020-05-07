//
//  ConnectionManager.swift
//  RxFlick
//
//  Created by Haider Ali Kazal on 26/4/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Alamofire

final class ConnectionManager {
    private static let defaultSession: Session = .init()
    
    static func request(with router: URLRequestConvertible) -> DataRequest {
        let request = defaultSession.request(router).validate()
        return request
    }
}
