//
//  ItemDetailsView.swift
//  meli
//
//  Created by David Londoño on 9/07/22.
//

import SwiftUI

struct ItemDetailsView: View {
    var id: String
    @State private var orientation = UIDeviceOrientation.unknown
    @StateObject var itemViewModel: ItemViewModel = ItemViewModel()
    @StateObject var descriptionViewModel: DescriptionViewModel = DescriptionViewModel()
    @State var screen = UIScreen.main.bounds
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(Color(ConstantsColors.blackMeli))
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                }
                Spacer()
            }.padding(.top, (screen.height > 850) ? 50 : 25)
                .background(Rectangle()
                    .foregroundColor(Color(ConstantsColors.yellowMeli))
                )
            //MARK: Here is the Item Content
            Text("Hola!")
            ScrollView{
                ForEach(itemViewModel.itemDetails, id: \.title) {item in
                    VStack{
                        Text("Elemento: \(item.title), precio: \(item.price), en condición de \(item.condition)")
                    }
                }
                ForEach(descriptionViewModel.itemDescription, id: \.description) {i in
                    Text("Description: \(i.description)")
                }
            }
            Spacer()
        }.onAppear{
            itemViewModel.getDetails(itemId: id)
            descriptionViewModel.getDescription(id: id)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
            .ignoresSafeArea()
            .preferredColorScheme(.light)
            .frame(maxWidth: .infinity)
            .background(Color(ConstantsColors.bgColor))
    }
}

