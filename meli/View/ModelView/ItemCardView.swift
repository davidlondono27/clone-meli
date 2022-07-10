//
//  ItemCardView.swift
//  meli
//
//  Created by David Londoño on 9/07/22.
//

import SwiftUI

struct ItemCardView: View {
    var image, title : String
    var price : Int
    var tags : [String]
    var condition : String
    
    var body: some View {
        NavigationLink(destination: ItemDetailsView()){
            HStack {
                AsyncImage(
                    url: URL(string: image),
                    content: { image in
                        image.resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 120, maxHeight: 120)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: 120, maxHeight: 120)
                    }
                )
                VStack(alignment: .leading, spacing: 5) {
                    Spacer()
                    if tags.contains("best_seller_candidate") {
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
                    Text(title)
                        .font(.system(size: 14))
                        .fontWeight(.thin)
                        .lineLimit(3)
                        .foregroundColor(Color(ConstantsColors.blackMeli))
                        .padding(.bottom, 5)
                    Text("$ \(price)")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .lineLimit(1)
                        .foregroundColor(Color(ConstantsColors.blackMeli))
                    if condition == "used" {
                    Text(Constants.used)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.vertical, 3)
                        .foregroundColor(Color(ConstantsColors.blueMeli))
                    }
                    Spacer()
                }.padding(.leading, 5)
                    .padding(.top, 5)
                Spacer()
            }
        }
    }
}

