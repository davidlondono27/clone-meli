//
//  Details.swift
//  meli
//
//  Created by David Londoño on 14/07/22.
//

import SwiftUI

struct bestSeller: View {
    var body: some View {
        Text(Constants.bestSeller)
            .font(.system(size: 10))
            .fontWeight(.medium)
            .padding(.all, 3)
            .foregroundColor(Color(ConstantsColors.whiteMeli))
            .background{
                Rectangle()
                    .foregroundColor(Color(ConstantsColors.orangeMeli))
                    .cornerRadius(3)
            }
    }
}

struct used: View {
    var body: some View {
        Text(Constants.used)
            .font(.system(size: 12))
            .fontWeight(.medium)
            .padding(.vertical, 3)
            .foregroundColor(Color(ConstantsColors.blueMeli))
    }
}
