//
//  LanguageSection.swift
//  Resume
//
//  Created by Navneet Singh on 4/12/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct LanguageSection: View {
    @Binding var languages: [Resume.Language]
    
    var body: some View {
        Section(header: Text("Languages"), content: {
            
            ForEach(languages, id: \.language){ (language:Resume.Language) in
                HStack {
                    VStack(alignment: .leading) {
                        Text(language.language)
                            .font(.headline)
                            .fontWeight(.medium)
                        Text(language.level)
                            .font(.callout)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    HStack {
                        ForEach(1..<6){ i in
                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundColor(i <= language.rating ?
                                    .blue : .gray)
                        }
                    }
                }
                .padding(.vertical, 5)
                
            }
        })
    }
}


