//
//  Network.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import Foundation

//MARK: Get data with URL Session
final class SearchViewModel: ObservableObject {
    @Published var totalItems : Int = 0
    @Published var itemsJSON : [Product] = []

    func executeAPI(itemqr: String) {
        let urlSession = URLSession.shared
        let url = URL(string: "\(ConstantsURL.searchURL)\(itemqr)")

        urlSession.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let itemDataModel = try! JSONDecoder().decode(MainResult.self, from: data)                
                DispatchQueue.main.async {
                    self.totalItems = itemDataModel.total_Products.total
                    self.itemsJSON = itemDataModel.products
                }                
            }
        }.resume()
    }
}
