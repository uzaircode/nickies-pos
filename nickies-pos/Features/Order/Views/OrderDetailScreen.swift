//
//  OrderDetailScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct OrderDetailScreen: View {
  var order: Order
    var body: some View {
      Text(order.status)
    }
}

#Preview {
  OrderDetailScreen(order: Order(id: 1, status: "Pending"))
    .environment(OrderStore(supabaseClient: .development))
}
