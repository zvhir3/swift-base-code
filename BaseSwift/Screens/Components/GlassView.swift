//
//  GlassView.swift
//  BaseSwift
//
//  Created by Nightfall Nest on 14/05/2024.
//

import SwiftUI

struct GlassView<Content: View>: View {
    let content: Content
    
    let gradientSurface = LinearGradient(
        colors: [.white.opacity(0.1), .clear],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    let gradientBorder = LinearGradient(
        colors: [.white.opacity(0.5), .white.opacity(0.0), .white.opacity(0.0), .green.opacity(0.0), .green.opacity(0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 0)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.6)
            .foregroundStyle(gradientSurface)
            .background(.ultraThinMaterial)
            .mask( RoundedRectangle(
                cornerRadius: 15,
                style: .circular)
                .foregroundColor(.black) )
            .shadow(color: .black.opacity(0.25),
                    radius: 5, x: 0, y: 8)
        VStack {
            Spacer()
            content
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height * 0.6)
    }
}
