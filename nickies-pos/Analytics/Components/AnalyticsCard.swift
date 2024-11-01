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
          .foregroundStyle(.black)
          .padding(.bottom, 10)
        Text(text)
          .foregroundStyle(Color.gray)
        Text(number)
          .font(.largeTitle)
          .foregroundStyle(.black)
      }
      .padding()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .cornerRadius(20)
  }
}

#Preview {
  AnalyticsCard(icon: "dollarsign.circle.fill", text: "Revenue", number: "RM456.00")
}
