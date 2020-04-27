//
//  ResumeViewModal.swift
//  Resume
//
//  Created by Navneet Singh on 4/13/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import Foundation
import Combine

class ResumeViewModal:ViewModelProtocol {
    //MARK:- Publishers
    @Published var sectionsHeaders : [String] = []
    @Published var profile : [Resume.Profile] = []
    @Published var summary : [String] = []
    @Published var skills : [Resume.Skill] = []
    @Published var experience : [Resume.Experience] = []
    @Published var education : [Resume.Education] = []
    @Published var languages : [Resume.Language] = []
    @Published var disableRefreshButton : Bool = true
    
    //MARK:- Private variables
    private let headers: [String] = ["","Summary",
                                     "Experience", "Technical Skills",
                                     "Education","Languages"]
    private var networkManager : NetworkManager
    private var disposables = Set<AnyCancellable>()
    private var resumeDetails: Resume?{
        didSet{
            sectionsHeaders = headers
            guard let details = resumeDetails else{ return }
            
            profile = [details.profile]
            summary = details.summary
            experience = details.experience
            skills = details.skills
            education = details.education
            languages = details.languages
        }
    }
    
    init(session: URLSession = .shared ) {
        networkManager = NetworkManager(session: session)
        fetchResume()
    }
}

extension ResumeViewModal {
    func fetchResume(){
        disableRefreshButton = true
        // Publisher
        networkManager.fetchDataFromServer()
            .receive(on: DispatchQueue.main)
            
            // Subscriber
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    switch completion {
                    case .failure(_):
                        self.sectionsHeaders.removeAll()
                        
                    case .finished:
                        self.disableRefreshButton = false
                        break
                    }
                }, receiveValue: { [weak self] data in
                    guard let self = self else { return }
                    self.resumeDetails = data
            })
            .store(in: &disposables)
    }
    
    func refreshBarButtonTapped() {
        fetchResume()
    }
}

