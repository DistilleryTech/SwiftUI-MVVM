//
//  Constants.swift
//  PlasticChallenge
//
//  Created by Navneet Singh on 22/08/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import UIKit

struct Constants {
    //Nework related constants
    struct Network {
        static let API = "https://gist.githubusercontent.com/navneet1990/eb7b405d650060d7aa504dab5b3b915e/raw/4fe5aa7958c26f9d4928dbbb7908cbf4d195b052/resume.json"
    }

    // Mock Data constants
    struct Mock {
        static var data : Data?  {
            guard  let url = Bundle.main.url(forResource: "mock", withExtension: "json"),let data = try? Data(contentsOf: url ) else {
                return nil
            }
            return data
        }
        static let image = UIImage.init(named: "mockUserImage")
    }

    // UI Properties
    static let screenSize = UIScreen.main.bounds
    struct IconDimensions {
        static let height: CGFloat = 20.0
    }

}
