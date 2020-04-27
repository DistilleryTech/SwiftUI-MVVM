//
//  DecodeData.swift
//  Resume
//
//  Created by Navneet Singh on 24/08/19.
//  Copyright © 2019 Navneet(navneet.aug1990@gmail.com,). All rights reserved.
//

import Foundation
import Combine

protocol DecodeData {
    /// Decode the data to Resume Object
    /// - Parameter data: Data to be decoded
    func decode(_ data: Data) -> AnyPublisher<Resume,ErrorResult>
}

extension  DecodeData{
    func decode(_ data: Data) -> AnyPublisher<Resume, ErrorResult> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return Just(data)
            .decode(type: Resume.self, decoder: decoder)
            .mapError { error in
                .parsing(description: error)
        }
        .eraseToAnyPublisher()
    }
}

