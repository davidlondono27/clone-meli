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
                //MARK: TopBar Information
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
            ScrollView{
                ForEach(itemViewModel.itemDetails, id: \.title) {item in
                    VStack{
                        if item.condition == "used" {
                            HStack {
                                Text("Usado")
                                    .font(.system(size: 12))
                                    .fontWeight(.light)
                                    .foregroundColor(Color(ConstantsColors.grayMeli))
                                Spacer()
                            }.padding(.top, 10)
                        }
                        
                        HStack() {
                            Text(item.title)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .foregroundColor(Color(ConstantsColors.grayDark))
                            Spacer()
                        }.padding(.top, 5)
                        
                        ScrollView(.horizontal){
                            HStack(spacing: 10) {
                                ForEach(item.pictures, id: \.url){index in
                                    AsyncImage(
                                        url: URL(string: index.url),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 400, maxHeight: 400)
                                        },
                                        placeholder: {
                                            ProgressView()
                                                .frame(width: 400, height: 400)
                                        }
                                    )
                                }
                            }
                        }
                        HStack {
                            Text("$ \(item.price)")
                                .font(.system(size: 35))
                                .fontWeight(.light)
                                .foregroundColor(Color(ConstantsColors.grayDark))
                            Spacer()
                        }
                    }
                }
                //MARK: ForEach for create element, list maybe skip the itemDescription
                ForEach(descriptionViewModel.itemDescription, id: \.description) {i in
                    HStack {
                        Text("\(Constants.description)\n\n\(i.description)")
                        Spacer()
                    }.padding(.top, 10)
                    .padding(.bottom, 20)
                }
            }.frame(width: screen.width * 0.9, alignment: .leading)
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
            .background(Color(ConstantsColors.whiteMeli))
    }
}
