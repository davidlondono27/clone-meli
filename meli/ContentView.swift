//
//  ContentView.swift
//  meli
//
//  Created by David Londoño on 6/07/22.
//

import SwiftUI

struct ContentView: View {
    
    var text = "MacBook Pro 14 pulgadas"
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                print(text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
