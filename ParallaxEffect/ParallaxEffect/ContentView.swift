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
        GeometryReader { geometry in
            let width = geometry.size.width
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 22) {
                    ForEach(images, id: \.self) { name in
                        ZStack {
                            MoviePosterView(imageName: name)
                                .frame(width: width, height: 1.25 * width)
                                .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                                    content.offset(x: phase.value * -(width/2))
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 44)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    ContentView()
}
