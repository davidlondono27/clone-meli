//
//  SearchView.swift
//  meli
//
//  Created by David Londoño on 6/07/22.
//

import SwiftUI

struct SearchView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @State var width : CGFloat = 10.0
    @State var height: CGFloat = 100.0
    @State var search = ""
    @StateObject var viewModel : ViewModel = ViewModel()
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack() {
                HStack(alignment: .top){
                    //MARK: Main Search Bar Layout
                        Spacer()
                    HStack {
                        //MARK: Search Layout
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 13))
                            .foregroundColor(Color(ConstantsColors.grayMeli))
                            .padding(.leading, 10)
                        TextField(text: $search){
                            Text(Constants.textFieldTip)
                                .fontWeight(.light)
                        }.font(.system(size: 15))
                            .modifier(clearButton(text: $search))
                            .padding(.vertical, 5)
                            .padding(.trailing, 10)
                            .onSubmit {
                                //MARK: Whitespaces and Network validation
                                if (networkManager.isConnected && (search.trimmingCharacters(in: .whitespacesAndNewlines) == "")) {
                                    networkManager.isConnected ? print("Introduzca un valor válido") : print("No tienes conexión a internet")
                                } else {
                                    viewModel.executeAPI(itemqr: search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                                }
                            }
                    }.background(
                        Rectangle()
                            .foregroundColor(Color(ConstantsColors.whiteMeli))
                            .cornerRadius(20))
                    Button(action: {hideKeyboard()}){
                        Text(Constants.cancel)
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(Color(ConstantsColors.blackMeli))
                        }.padding(.top, 5)
                        Spacer()
                }.padding(.top, height * 0.05)
                    .background(Rectangle()
                        .foregroundColor(Color(ConstantsColors.yellowMeli))
                        .frame(width: width, height: (height > height * 0.2) ? height * 0.15 : height * 0.2, alignment: .center))
                Spacer()
                //MARK: Here is the page content
                HStack {
                    Text((viewModel.totalItems == 0) ? Constants.searchTip : "\(viewModel.totalItems) \(Constants.results).")
                        .fontWeight(.light)
                        .font(.system(size: 15))
                        .padding(.leading, 10)
                        .foregroundColor(Color(ConstantsColors.blackMeli))
                    Spacer()
                }.frame(width: width, height: 40)
                .background(
                    Color(ConstantsColors.whiteMeli)
                        .shadow(color: .gray.opacity(0.6), radius: 2, x: 0, y: 1))
                List(viewModel.itemsJSON, id: \.title) { item in
//                    Text("Item: \(item.id) - \(item.title) por: \(item.price)")
                    ItemCardView(image: item.image, title: item.title, price: item.price, tags: item.tags, condition: item.condition)
                }.foregroundColor(Color(ConstantsColors.grayMeli))
                Spacer()
            }.navigationBarHidden(true)
                .ignoresSafeArea()
                .preferredColorScheme(.light)
                .background(
                    VStack {
                        Rectangle()
                            .foregroundColor(Color(ConstantsColors.yellowMeli))
                            .frame(width: width, height: height * 0.05, alignment: .top)
                        Spacer()
                        Rectangle()
                            .foregroundColor(Color(ConstantsColors.bgColor))
                        Spacer()
                        Rectangle()
                            .foregroundColor(Color(ConstantsColors.bgColor))
                    }
                    )
                .onRotate { newOrientation in
                    orientation = newOrientation
                    width = getRect().width
                    height = getRect().height
                }
        }
    }
}


//MARK: Add function to get Screen Bounds and function to hide Keyboard
extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}


//MARK: Detect when orientation view change
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

//MARK: Check the textfield for add the X button for clean
struct clearButton: ViewModifier {
    @Binding var text: String
    public func body(content: Content) -> some View {
        content
        if !text.isEmpty {
            Button(action: {
                self.text = ""
            }){
                Image(systemName: "x.circle.fill")
                    .foregroundColor(Color(uiColor: .opaqueSeparator))
            }
            .padding(.trailing, 1)
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewInterfaceOrientation(.portrait)
    }
}
