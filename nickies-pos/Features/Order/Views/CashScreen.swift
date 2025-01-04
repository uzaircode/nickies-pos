//
//  CashScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 21/12/2024.
//

import SwiftUI

struct CashScreen: View {
  @Environment(CartStore.self) private var store
  @Environment(\.dismiss) private var dismiss
  @State private var isShowingSheet = false

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 24) {
        totalPriceSection
        Divider()
          .frame(height: 3)
          .background(Color.gray.opacity(0.2))
        amountReceivedSection
      }
      .padding(24)
      Spacer()
        .background(Color(.systemBackground))
    }
    .sheet(isPresented: $isShowingSheet) {
      OrderSummaryScreen()
    }
  }
  
  private var totalPriceSection: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(formatted(amount: store.totalPrice))
        .font(.system(size: 48, weight: .bold))
      Text("Accept Cash")
        .font(.title2)
        .foregroundColor(.secondary)
    }
  }
  
  private var amountReceivedSection: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Amount Received")
        .font(.title2)
        .fontWeight(.semibold)
      
      createAmountButton(store.totalPrice)
      
      Group {
        if store.totalPrice.roundedToNearest05 != store.totalPrice {
          createAmountButton(store.totalPrice.roundedToNearest05)
        }
        if store.totalPrice.roundedTo10 != store.totalPrice {
          createAmountButton(store.totalPrice.roundedTo10)
        }
        if store.totalPrice.roundedTo50 != store.totalPrice {
          createAmountButton(store.totalPrice.roundedTo50)
        }
        createAmountButton(store.totalPrice.roundedTo100)
      }
    }
  }
  
  private func createAmountButton(_ amount: Double) -> some View {
    Button {
      Task {
        store.receivedAmount = amount
        let calculatedChange = store.change
        print("Change: \(calculatedChange)")
        isShowingSheet.toggle()
//        try await store.addOrder()
//        dismiss()
      }
    } label: {
      Text(formatted(amount: amount))
        .font(.system(size: 24, weight: .medium))
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
    }
    .buttonStyle(.bordered)
    .controlSize(.large)
  }
  
  private func formatted(amount: Double) -> String {
    String(format: "RM %.2f", amount)
  }
}

#Preview {
  CashScreen()
    .environment(CartStore(supabaseClient: .development))
}
