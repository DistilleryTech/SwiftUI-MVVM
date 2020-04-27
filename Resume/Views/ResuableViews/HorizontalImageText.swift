//
//  HorizontalImageText.swift
//  Resume
//
//  Created by Navneet Singh on 4/10/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI

struct HorizontalImageText: View {
    var imageName: String = ""
    var text: String = ""
    var font: Font = .body
    var hSpacing: CGFloat = 20.0
    
    var body: some View {
        HStack(spacing: hSpacing) {
            Image(systemName: imageName)
            
            Text(text)
                .font(font)
                .foregroundColor(Color.gray)
        }
        .padding(.leading)
    }
}


