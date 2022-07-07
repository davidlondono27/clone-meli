//
//  SearchView.swift
//  meli
//
//  Created by David Londoño on 6/07/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            VStack(){
                
            }.background(
                Rectangle()
                    .foregroundColor(Color(ConstantsColors.yellowMeli))
                    .frame(width: getRect().width, height: 150, alignment: .center)
        )
            Spacer()
        }.preferredColorScheme(.light)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


//MARK: Add function to get Screen Bounds
extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
