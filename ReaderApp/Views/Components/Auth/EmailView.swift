//
//  Form.swift
//  ReadSpeedster
//
//  Created by Andreas Antonsson on 2024-04-15.
//

import SwiftUI

struct EmailView: View {
    @ObservedObject var viewAdapter: AuthViewAdapter
    @Binding var userNameInput: String
    var customLabel: String
    var textSize: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: GridPoints.custom(16),height: GridPoints.x4)
                        .rotationEffect(.degrees(-GridPoints.x1))
                        .modifier(TextFeildStyling(
                            customBgColor: CustomColors.defaultGreen,
                            customBgStroke: .black,
                            height: GridPoints.x4))
                    Text(customLabel)
                        .font(Font.custom("PermanentMarker-Regular", size: textSize))
                        .rotationEffect(.degrees(-GridPoints.half))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.bottom, GridPoints.half)
            }
            .padding(.bottom, -GridPoints.x1)
            .rotationEffect(.degrees(-GridPoints.x1))
         
            TextField("", text: $userNameInput)
                .modifier(TextFeildStyling(customBgColor: .white, customBgStroke: CustomColors.homeBackgroundColor))
        }
    }
}

struct UserNameView_Previews: PreviewProvider {
    @State static var userNameInput: String = ""
    @State static var passwordInput: String = ""
    
    static var previews: some View {
        EmailView(viewAdapter: AuthViewAdapter(),
                  userNameInput: $userNameInput, customLabel: "User Name", textSize: 14)
        .previewLayout(.sizeThatFits)
    }
}
