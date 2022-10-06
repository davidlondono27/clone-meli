//
//  NetworkManager.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.sync {
                self.isConnected = path.status == .satisfied
            }
            print("Validando red...")
        }
    }
}
