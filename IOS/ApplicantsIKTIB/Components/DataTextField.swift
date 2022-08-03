//
//  DataTextField.swift
//  ApplicantsIKTIB
//
//  Created by User on 04.04.2022.
//

import SwiftUI

struct DataTextField: View {

    @Binding var username: String
    var placeHolder: String

    var body: some View {

        TextField(placeHolder,
                  text: $username)
            .foregroundColor(.black)
            .frame(width: .none, height: 30)
            .disableAutocorrection(true)
            .border(.blue)
            .padding([.leading, .trailing], 30)
    }
}

/*
struct DataTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        DataTextField( placeHolder: "Введите название")
    }
}*/
