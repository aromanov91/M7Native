//
//  File.swift
//  
//
//  Created by Alexander Romanov on 27.09.2020.
//

import SwiftUI

public struct M7BlurView: UIViewRepresentable {
    
    public init(_ style: UIBlurEffect.Style = .light) {
        self.style = style
    }
    
    public let style: UIBlurEffect.Style
    
    public func makeUIView(context: UIViewRepresentableContext<M7BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    public func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<M7BlurView>) {
        
    }
    
}

