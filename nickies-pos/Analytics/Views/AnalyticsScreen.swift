//
//  AnalyticsScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 01/11/2024.
//

import SwiftUI

struct AnalyticsScreen: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 16) {
          AnalyticsCard(icon: "dollarsign.circle.fill", text: "Revenue", number: "RM1200.56")
          AnalyticsCard(icon: "dollarsign.circle.fill", text: "Paid Orders", number: "198")
          AnalyticsCard(icon: "dollarsign.circle.fill", text: "Tip amount", number: "227")
        }
        Spacer()
      }
      .navigationTitle("Analytics")
      .padding(.horizontal)
    }
  }
}

#Preview {
  AnalyticsScreen()
}
