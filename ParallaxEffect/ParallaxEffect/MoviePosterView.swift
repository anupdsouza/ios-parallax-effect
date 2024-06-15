//
//  MoviePosterView.swift
//  ParallaxEffect
//
//  Created by Anup D'Souza on 14/06/24.
//

import SwiftUI

struct MoviePosterView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 300, height: 450)
            .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    MoviePosterView(imageName: "1")
}
