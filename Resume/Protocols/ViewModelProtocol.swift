//
//  PlastiResumeiewModelProtocol.swift
//  PlasticChallenge
//
//  Created by Navneet Singh on 22/08/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import Combine
protocol ViewModelProtocol : ObservableObject {
    //Variables
    var sectionsHeaders : [String] {get set}
    var profile : [Resume.Profile] {get set}
    var summary : [String] {get set}
    var skills : [Resume.Skill] {get set}
    var experience : [Resume.Experience] {get set}
    var education : [Resume.Education] {get set}
    var languages : [Resume.Language] {get set}
    var disableRefreshButton : Bool {get set}
    
    // Methods
    func refreshBarButtonTapped()
}
