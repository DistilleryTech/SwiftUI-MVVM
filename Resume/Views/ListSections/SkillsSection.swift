//
//  SkillsSection.swift
//  Resume
//
//  Created by Navneet Singh on 4/10/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct SkillsSection: View {
    @Binding var skills: [Resume.Skill]
    
    var body: some View {
        Section(header: Text("Techinical Skills")){
            
            ForEach(skills, id: \.name){ (skill: Resume.Skill) in
                
                VStack(alignment: .leading, content: {
                    Text(skill.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Text(skill.skills)
                        .font(.footnote)
                })
                    .padding(.bottom, 5)
            }
        }
    }
}
