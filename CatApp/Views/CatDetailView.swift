//
//  CatDetailView.swift
//  CatApp
//
//  Created by Sebastian Koller on 11.05.24.
//

import SwiftUI

struct CatDetailView: View {
    let cat: Cat
    
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(cat.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    if let catImage = cat.imageUrl {
                        AsyncImage(url: URL(string: catImage.url)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure(_):
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.gray)
                                    .opacity(0.3)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .aspectRatio(contentMode: .fit)
                    }

                    Text("Description")
                        .font(.headline)
                    Text(cat.description)
                }
                .padding()
            }
            .navigationBarTitle("Details", displayMode: .inline)
        }
}

#Preview {
    CatDetailView(cat: Cat(id: "1", name: "Perser", description: "Eine ruhige Katzenrasse.", imageUrl: nil))
}
