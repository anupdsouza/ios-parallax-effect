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
    private let titles = [
        "Iron Man",
        "Captain America: The First Avenger",
        "The Avengers",
        "Thor: Ragnarok",
        "Black Panther",
        "Avengers: Infinity War",
        "Avengers: Endgame"
    ]
    @Environment(\.colorScheme) private var colorScheme
    
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
                        ForEach(images.indices, id: \.self) { index in
                            ZStack {
                                MoviePosterView(imageName: images[index])
                                    .frame(width: width, height: height)
                                    .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                                        content.offset(x: phase.value * offset)
                                    }
                                    .overlay {
                                        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                                    }
                                    .overlay(alignment: .bottom) {
                                        Text(titles[index])
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding(.bottom, 44)
                                    }
                            }
                            .containerRelativeFrame(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                            .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), radius: 5, x: 0, y: 2)
                        }
                    }
                    .scrollTargetLayout()
                    .padding([.top, .bottom], 20)
                }
                .frame(height: height)
                .contentMargins(.horizontal, 44)
                .scrollTargetBehavior(.paging)
            }
        }
    }
}

#Preview {
    ContentView()
}
