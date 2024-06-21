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
            let height = 1.25 * width
            let offset = -width/2
            VStack(spacing: 20) {

                Text("Marvel Cinematic Universe")
                    .font(.title)
                    .bold()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 22) {
                        ForEach(images, id: \.self) { name in
                            ZStack {
                                MoviePosterView(imageName: name)
                                    .frame(width: width, height: height)
                                    .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                                        content.offset(x: phase.value * offset)
                                    }
                            }
                            .containerRelativeFrame(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
                        }
                    }
                    .scrollTargetLayout()
                    .padding([.top, .bottom], 20)
                }
                .frame(height: height)
                .contentMargins(.horizontal, 44)
                .scrollTargetBehavior(.paging)
                
                Text("Movie name")
                    .font(.title2)
                    .bold()
            }
        }
    }
}

#Preview {
    ContentView()
}
