//
//  NetworkManager.swift
//  PlasticChallenge
//
//  Created by Navneet Singh on 21/08/19.
//  Copyright © 2019 Navneet(navneet.aug1990@gmail.com,). All rights reserved.
//

import Foundation
import Combine

class NetworkManager {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}
extension NetworkManager: NetworkProtocol  {
    typealias ResumeResult = AnyPublisher<Resume,ErrorResult>
    
    func fetchDataFromServer(urlString: String = Constants.Network.API) -> ResumeResult {
        return feteh(urlString: urlString)
    }
    
    private func feteh(urlString: String) -> ResumeResult {
        
        // Create a URL to load, and a URLSession to load it.
        guard let jsonURL = URL(string: urlString) else {
            return Fail(error: .invalidUrl).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: jsonURL))
            .mapError { error in
                .network(description: error)
        }
        .flatMap(maxPublishers: .max(1)) { pair  in
            self.decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
}
extension NetworkManager: DecodeData{}
