//
//  OrderScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 13/12/2024.
//

import SwiftUI

struct OrderScreen: View {
  
  @Environment(OrderStore.self) private var store
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(store.orders) { order in
          NavigationLink {
            OrderDetailScreen(order: order)
          } label: {
            VStack(alignment: .leading) {
              Text("#\(order.id)")
              Text(order.status)
                .font(.body)
            }
          }
        }
      }
      .onAppear {
        Task {
          do {
            try await store.fetchOrders()
          } catch {
            print(error)
          }
        }
      }
      .navigationTitle("Orders")
      .listStyle(.plain)
    }
  }
}

#Preview {
  OrderScreen()
    .environment(OrderStore(supabaseClient: .development))
}
