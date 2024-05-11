//
//  CatData.swift
//  CatApp
//
//  Created by Sebastian Koller on 11.05.24.
//

import Foundation

class CatService {
    func fetchCats(completion: @escaping (Result<[Cat], Error>) -> Void) {
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        var request = URLRequest(url: url)
        request.addValue(Configuration.apiKey, forHTTPHeaderField: "x-api-key")  // Setze hier deinen API-Key ein

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            //if let jsonString = String(data: data, encoding: .utf8) {
            //    print("Empfangene JSON-Daten: \(jsonString)")
            //}
            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                completion(.success(cats))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
