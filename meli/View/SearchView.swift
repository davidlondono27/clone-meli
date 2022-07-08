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
    var items = ["item 1", "Item 2", "Item 3", "Item 4"]
    
    var body: some View {
        NavigationView {
            VStack() {
                    HStack(alignment: .top){
                            Spacer()
                        HStack {
                            //MARK: Search Layout
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 14))
                                .foregroundColor(Color(ConstantsColors.grayMeli))
                                .padding(.leading, 10)
                            TextField(text: $search){
                                Text("Buscar en Mercado Libre")
                            }.font(.custom(ConstantsFonts.proximaNova, size: 16))
                                .modifier(clearButton(text: $search))
                                .padding(.vertical, 5)
                                .padding(.trailing, 10)
                                
                        }.background(
                            Rectangle()
                                .foregroundColor(Color(ConstantsColors.whiteMeli))
                                .cornerRadius(20))
                        Button(action: {hideKeyboard()}){
                            Text("Cancelar")
                                .font(.custom(ConstantsFonts.proximaNova, size: 16))
                                .foregroundColor(Color(ConstantsColors.blackMeli))
                        }.padding(.top, 5)
                            Spacer()
                        }.padding(.top, 50)
                        .background(
                            Rectangle()
                                .foregroundColor(Color(ConstantsColors.yellowMeli))
                                .frame(width: width, height: height * 0.1, alignment: .center)
                        )
                    Spacer()
                    //MARK: Here is the content
                    List(items, id: \.self) {item in
                        Text(item)
                    }
                    Spacer()
            }.navigationBarHidden(true)
                .ignoresSafeArea()
                .preferredColorScheme(.light)
                .background(Color(ConstantsColors.yellowMeli))
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
