//
//  ErrorResult.swift
//  PlasticChallenge
//
//  Created by Navneet Singh on 21/08/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation

// Error enum
enum ErrorResult: Error {
    case invalidUrl
    case network(description: Error)
    case parsing(description: Error)
    case invalidDataFormat
}

extension ErrorResult: LocalizedError {
    public var description: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString("Could not create a URL", comment: "")
        case .network(description: let description):
            return description.localizedDescription
        case .invalidDataFormat:
            return NSLocalizedString("Could not digest the fetched data", comment: "")
        case .parsing(description: let description):
            return description.localizedDescription
        }
    }
    public var title: String?{
        switch self {
        case .invalidUrl:
            return NSLocalizedString("Invalid Url", comment: "")
        case .invalidDataFormat:
            return NSLocalizedString("Invalid Data", comment: "")
        case .network(description: _):
            return NSLocalizedString("Network", comment: "")
        case .parsing(description: _):
            return NSLocalizedString("Parsing", comment: "")
            
        }
    }
}
