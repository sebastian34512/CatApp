//
//  CatListView.swift
//  CatApp
//
//  Created by Sebastian Koller on 11.05.24.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel = CatViewModel()

        var body: some View {
            NavigationView {
                List(viewModel.cats) { cat in
                    NavigationLink(destination: CatDetailView(cat: cat)) {
                        Text(cat.name)
                    }
                }
                .navigationBarTitle("Cat Breeds")
                .onAppear {
                    viewModel.fetchCats()
                }
            }
        }
}

#Preview {
    CatListView()
}
