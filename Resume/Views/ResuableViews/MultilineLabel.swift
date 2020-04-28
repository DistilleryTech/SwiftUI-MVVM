//
//  MultilineLabel.swift
//  Resume
//
//  Created by Navneet Singh on 4/27/20.
//  Copyright © 2020 Navneet Singh. All rights reserved.
//

import SwiftUI
import Combine

struct MultilineLabel: UIViewRepresentable {
    typealias UIViewType = UILabel
    @Binding var content: [String]

    func makeUIView(context: Context) -> UILabel {
        let label = UIViewType()
        label.font = UIFont.systemFont(ofSize: 16)
        label.lineBreakMode = .byWordWrapping
        label.autoresizesSubviews = true
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.attributedText = content.showMultiline()
        return label
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.attributedText = content.showMultiline()
    }
}
