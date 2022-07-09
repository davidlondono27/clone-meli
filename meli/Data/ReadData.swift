//
//  ReadData.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import Foundation

class ReadData : ObservableObject {
    @Published var items = [MainResult]()
    init(){
        loadData()
    }
    
    func loadData(){
        
    }
}
