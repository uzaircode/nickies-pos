//
//  OrderSummaryScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct OrderSummaryScreen: View {
  @Environment(CartStore.self) private var store
  
  private func formatted(amount: Double) -> String {
    String(format: "RM %.2f", amount)
  }
  
  var body: some View {
    VStack {
      Text("Change due: MYR \(formatted(amount: store.change))")
    }
    .interactiveDismissDisabled()
  }
}

#Preview {
  OrderSummaryScreen()
    .environment(CartStore(supabaseClient: .development))
}
