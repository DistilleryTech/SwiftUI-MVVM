//
//  ContentView.swift
//  Resume
//
//  Created by Navneet Singh on 4/6/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct ResumeHomeView: View {
    @ObservedObject var viewModel: ResumeViewModal
    
    init() {
        viewModel = ResumeViewModal.init()
    }
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.sectionsHeaders.isEmpty {
                    emptySection
                }
                else{
                    ForEach.init(0..<viewModel.sectionsHeaders.count) { index in
                        self.buildSection(at: index)
                            .padding(.horizontal, 10)
                    }
                }
            }
            .navigationBarTitle("Resume")
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.fetchResume()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            ).disabled(viewModel.disableRefreshButton)
        }
    }
}


private extension ResumeHomeView {
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    func buildSection(at index: Int) -> some View {
        switch SectionTypes.init(rawValue: index) {
        case .profile:
            return AnyView(ProfileSection(profile: $viewModel.profile))
        case .summary:
            return AnyView(SummarySection(summary: $viewModel.summary))
        case .experience:
            return AnyView(ExperienceSection(experiences: $viewModel.experience))
        case .skills:
            return AnyView(SkillsSection(skills: $viewModel.skills))
        case .education:
            return AnyView(EducationSection(education: $viewModel.education))
        case .languages:
            return AnyView(LanguageSection(languages: $viewModel.languages))
        default:
            return AnyView(emptySection)
        }
    }
}
struct ResumeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeHomeView()
    }
}

