//
//  LoadView.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import SwiftUI
import SwiftData

struct LoadView: View {
    @StateObject var moviesViewModel = MoviesViewModel()

    var body: some View {
        HStack {
            ProgressView().padding(.trailing, 5)
            Text("load.load_more_data").font(.subheadline).foregroundStyle(.gray)
        }.padding(.vertical, 5)
    }
}

#Preview {
    LoadView()
}
