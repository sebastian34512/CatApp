//
//  CatViewModel.swift
//  CatApp
//
//  Created by Sebastian Koller on 11.05.24.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    private var service = CatService()

    func fetchCats() {
        service.fetchCats { [weak self] result in
            switch result {
            case .success(let cats):
                DispatchQueue.main.async {
                    self?.cats = cats
                }
            case .failure(let error):
                print("Error fetching cats: \(error)")
            }
        }
    }
}

