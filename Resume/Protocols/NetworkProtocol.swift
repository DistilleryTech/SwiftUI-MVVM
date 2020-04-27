//
//  NetworkProtocol.swift
//  PlasticChallenge
//
//  Created by Navneet Singh on 22/08/19.
//  Copyright © 2019 Navneet. All rights reserved.
//
import Foundation
import Combine

// Network Protocol
protocol NetworkProtocol : class {
    /// Method to fetch data server
    ///
    /// - Parameters:
    ///   - urlString: Url to interact with server
    func fetchDataFromServer(urlString: String) -> AnyPublisher<Resume,ErrorResult>
}
