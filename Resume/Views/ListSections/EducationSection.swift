//
//  EducationCell.swift
//  Resume
//
//  Created by Navneet Singh on 4/10/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct EducationSection: View {
    @Binding var education: [Resume.Education]
    
    var body: some View {
        Section(header: Text("Education"), content: {
            ForEach(education, id: \.duration){ (education: Resume.Education) in
                
                VStack(alignment: .leading, spacing: 5, content: {
                    // Degree
                    Text(education.specialization)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(nil)
                    
                    University(school: education.school,
                               score: education.cgpa)
                    
                    HorizontalImageText(imageName: "calendar",
                                        text: education.duration,
                                        font: .caption,
                                        hSpacing: 10)
                })
                    .padding(.vertical, 5)
            }
        })
    }
}

private struct University: View {
    private let school: String
    private let score: String
    
    init(school: String, score: Float) {
        self.school = school
        self.score = String.init(score)
    }
    
    var body: some View {
        HStack(spacing: 30.0) {
            // University
            Text(school)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.blue)
                .fixedSize(horizontal: false, vertical: true)
            
            Divider()
                .frame(width: 2.0, height: 70.0)
                .background(Color.gray)
            
            VStack(spacing: 10.0){
                Text("CGPA")
                    .font(.callout)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 10.0) {
                    Text(score)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.leading)
                    
                    Text("/")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    
                    
                    Text("10.0")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.trailing)
                }
            }
            
        }
    }
}
