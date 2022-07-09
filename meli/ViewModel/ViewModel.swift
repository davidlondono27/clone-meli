//
//  Network.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import Foundation
import Combine

//MARK: Get data with URL Session
final class ViewModel: ObservableObject {
    @Published var totalItems : Int = 0
    @Published var itemsJSON : [Product] = []

    func executeAPI(itemqr: String) {
        let urlSession = URLSession.shared
        let url = URL(string: "https://api.mercadolibre.com/sites/MCO/search?q=\(itemqr)")

        urlSession.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let itemDataModel = try! JSONDecoder().decode(MainResult.self, from: data)
                print("Items: \(itemDataModel)")
                DispatchQueue.main.async {
                    self.totalItems = itemDataModel.total_Products.total
                    self.itemsJSON = itemDataModel.products
                }                
            }
        }.resume()
    }
}
