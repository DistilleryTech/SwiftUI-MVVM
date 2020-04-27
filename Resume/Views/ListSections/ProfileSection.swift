//
//  ProfileSection.swift
//  Resume
//
//  Created by Navneet Singh on 4/6/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI
import Combine

struct ProfileSection: View {
    @Binding var profile: [Resume.Profile]
    
    var body: some View {
        Section {
            ForEach(profile, id: \.name){ (profile:Resume.Profile) in
                
                VStack(alignment: .center,  content: {
                    //Image
                    UserPhoto(url: profile.image)
                    
                    // Text
                    Text(profile.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    
                    // Text
                    Text(profile.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    
                    VStack(alignment: .center, spacing: 5.0) {
                        HorizontalImageText(imageName: "camera",
                                            text: profile.email)
                        HorizontalImageText(imageName: "phone",
                                            text: profile.phone)
                        HorizontalImageText(imageName: "location",
                                            text: profile.currentLocation)
                        
                    }
                    .padding(.horizontal)
                })
                    
                    .padding(.vertical, 10)
            }
            
        }
    }
}

private struct UserPhoto: View {
    @ObservedObject private var loader: ImageLoader
    
    init(url: String?) {
        loader = ImageLoader(url: url)
    }
    
    var body: some View {
        
        image
            .resizable()
            .frame(width: 120.0, height: 120.0)
            .clipShape(Circle())
            .shadow(radius: 10)
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: Image {
        var defaultImage = Image("placeholder")
        
        if loader.image != nil {
            defaultImage = Image(uiImage: loader.image!)
        }
        return defaultImage
    }
    
}
