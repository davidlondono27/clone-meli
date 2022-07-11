//
//  ItemViewModel.swift
//  meli
//
//  Created by David Londoño on 10/07/22.
//

import Foundation

//MARK: Get Details and Item Images List
final class ItemViewModel: ObservableObject {
    @Published var itemDetails : [MainItem] = []
    
    func getDetails(itemId: String) {
        let urlSession = URLSession.shared
        let url = URL(string: "\(ConstantsURL.itemBaseURL)\(itemId)")
        
        urlSession.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print(Constants.itemError)
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let mainDetails = try! JSONDecoder().decode(MainItem.self, from: data)
                DispatchQueue.main.async {
                    self.itemDetails = [mainDetails]
                }
            }
        }.resume()
    }
}

//MARK: Get Item Description
final class DescriptionViewModel: ObservableObject {
    @Published var itemDescription : [ItemDescription] = []
    
    func getDescription(id: String) {
        let urlSession = URLSession.shared
        let url = URL(string: "\(ConstantsURL.itemBaseURL)\(id)\(ConstantsURL.descriptionURL)")
        
        urlSession.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print(Constants.itemDetailsError)
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let itemDetails = try! JSONDecoder().decode(ItemDescription.self, from: data)
                DispatchQueue.main.async {
                    self.itemDescription = [itemDetails]
                }
            }
        }.resume()
    }
}
