//
//  DisconnectView.swift
//  meli
//
//  Created by David Londoño on 8/07/22.
//

import SwiftUI

struct DisconnectView: View {
    var screen = UIScreen.main.bounds
    
    var body: some View {
        VStack(){
            Spacer()
                .frame(height: screen.height * 0.15)
            Image(ConstantsImages.DisconnectedCat)
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text(Constants.disconnectedText)
                .foregroundColor(Color(ConstantsColors.grayDark))
                .font(.system(size: 20))
                .fontWeight(.light)
                .padding(.vertical, 3)
                .frame(maxWidth: screen.width * 0.9, alignment: .center)
                .multilineTextAlignment(.center)
            Text(Constants.reviewConnection)
                .foregroundColor(Color(ConstantsColors.grayDark))
                .font(.system(size: 18))
                .fontWeight(.thin)
                .frame(maxWidth: screen.width * 0.9, alignment: .center)
                .multilineTextAlignment(.center)
            Spacer()
        }.frame(maxWidth: .infinity)
            .background(Color(ConstantsColors.bgColor))
    }
}

struct DisconnectView_Previews: PreviewProvider {
    static var previews: some View {
        DisconnectView()
    }
}
