//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Anup D'Souza on 14/06/24.
//  🕸️ https://www.anupdsouza.com
//  🔗 https://twitter.com/swift_odyssey
//  👨🏻‍💻 https://github.com/anupdsouza
//  ☕️ https://www.buymeacoffee.com/anupdsouza
//

import SwiftUI

struct ContentView: View {
    private let images = (1...7).map { "\($0)" }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(images, id: \.self) { name in
                    MoviePosterView(imageName: name)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content.offset(x: phase.value * -250)
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 32)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    ContentView()
}
