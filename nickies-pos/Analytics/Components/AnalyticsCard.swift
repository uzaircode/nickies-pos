//
//  AnalyticsCard.swift
//  nickies-pos
//
//  Created by Nik Uzair on 01/11/2024.
//

import SwiftUI

struct AnalyticsCard: View {
  @State var icon: String = ""
  @State var text: String = ""
  @State var number: String = ""
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Image(systemName: icon)
          .resizable()
          .frame(width: 30, height: 30)
          .foregroundStyle(.white)
          .padding(.bottom, 10)
        Text(text)
          .foregroundStyle(Color(uiColor: .systemGray))
        Text(number)
          .font(.largeTitle)
          .foregroundStyle(.white)
      }
      .padding()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color(uiColor: .systemGray5))
    .cornerRadius(20)
  }
}

#Preview {
  AnalyticsCard(icon: "dollarsign.circle.fill", text: "Revenue", number: "RM456.00")
}
