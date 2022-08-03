//
//  EventTag.swift
//  ApplicantsIKTIB
//
//  Created by СКБ on 28.07.2022.
//

import SwiftUI

struct EventTag: View {
  var placeHolderTag: String
  var placeHolderMoney: Int

  var body: some View {
    HStack(spacing: 10) {

      Text("\(placeHolderTag)")
        .frame(width: 64, height: 21)
        .font(.system(size: 12, weight: .regular))
        .foregroundColor(Color(Asset.blue2.name))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
              .stroke(Color(Asset.blue2.name), lineWidth: 1)
        )

      HStack(alignment: .center, spacing: 3) {
        Text("\(placeHolderMoney)")
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.white)

        Image(Asset.money.name)

      }
      .frame(width: 58, height: 21)
      .background(Color(Asset.blue2.name))
      .cornerRadius(5)
    }
  }
}

struct EventTag_Previews: PreviewProvider {
    static var previews: some View {
        EventTag(placeHolderTag: "Онлайн", placeHolderMoney: 10)
    }
}
