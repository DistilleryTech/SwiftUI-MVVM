//
//  SummarySection.swift
//  Resume
//
//  Created by Navneet Singh on 4/8/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct SummarySection: View {
    @Binding var summary: [String]
    
    var body : some View {
        Section(header: Text("Summary")) {
            ForEach(summary, id: \.self) { item in
                Text(item)
                    .font(Font.system(size: 16))
                    .fontWeight(.regular)
                    .padding(.vertical, 5)
            }
        }
    }
}
