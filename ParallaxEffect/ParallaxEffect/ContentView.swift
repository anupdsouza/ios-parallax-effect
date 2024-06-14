//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Anup D'Souza on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    private let images = (1...7).map { "\($0)" }

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(images, id: \.self) { name in
                    VStack(spacing: 8) {
                        ZStack {
                            MoviePosterView(imageName: name)
                                .scrollTransition(
                                    axis: .horizontal
                                ) { content, phase in
                                    return content
                                        .offset(x: phase.value * -250)
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                    
                }.scrollTargetLayout()
            }
            .contentMargins(.horizontal, 32)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ContentView()
}
