//
//  EnterButton.swift
//  ApplicantsIKTIB
//
//  Created by User on 04.04.2022.
//

import SwiftUI

struct EnterButton: View {

    var placeHolder: String

    var body: some View {

            Text(placeHolder)
                .frame(width: 300, height: .none)
                .foregroundColor(.white)
                .font(.custom("AvenirNext-Bold", size: 20))
                .background(Color("button"))
                .cornerRadius(40)

    }
}

/*
struct EnterButton_Previews: PreviewProvider {
    static var previews: some View {
        EnterButton(placeHolder: "Aboba")
    }
}
*/
