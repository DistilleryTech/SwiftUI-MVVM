//
//  NetworkSessionProtocol.swift
//  Resume
//
//  Created by Navneet Singh on 22/08/19.
//  Copyright © 2019 Navneet(navneet.aug1990@gmail.com,). All rights reserved.
//

import Foundation
import Combine

protocol NetworkSession {

    /// Url Session to send request to server
    ///
    /// - Parameters:
    ///   - url: Url pass to interact with server
    ///   - completionHandler:  Response in form of Resume if successfull otherwise error
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void)
}
