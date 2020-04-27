//
//  ExperienceSection.swift
//  Resume
//
//  Created by Navneet Singh on 4/8/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct ExperienceSection: View {
    @Binding var experiences: [Resume.Experience]
    
    var body: some View {
        Section(header: Text("Experience")) {
            
            ForEach(experiences, id: \.duration){ (experience:Resume.Experience) in
                
                VStack(alignment: .leading, spacing: 10.0) {
                    // Position
                    Text(experience.position)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    
                    // Company
                    Text(experience.company)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.leading)
                    
                    // Date - Location
                    HStack(spacing: 30.0) {
                        HorizontalImageText(imageName: "calendar",
                                            text: experience.duration,
                                            font: .caption,
                                            hSpacing: 10.0)
                        HorizontalImageText(imageName: "location",
                                            text: experience.location,
                                            font: .caption,
                                            hSpacing: 10.0)
                    }
                    
                    // About Company
                    Text(experience.summary)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    //Responsibilites
                    ForEach(experience.highlights, id: \.self){ content in
                        Text(content)
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                }
                .padding(.vertical, 5)
            }
        }
    }
}

