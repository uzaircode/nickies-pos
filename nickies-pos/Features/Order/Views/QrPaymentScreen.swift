//
//  QrPaymentScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct QrPaymentScreen: View {
  
  @Environment(CartStore.self) private var store
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    VStack {
      Image(.qrPayment)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding()
      Button {
        Task {
          try await store.addOrder()
        }
        dismiss()
      } label: {
        Text("Done")
          .font(.system(size: 24, weight: .medium))
          .frame(maxWidth: .infinity)
          .padding(.vertical, 5)
      }
      .buttonStyle(.bordered)
      .controlSize(.large)
    }
    .padding()
  }
}

#Preview {
  QrPaymentScreen()
    .environment(CartStore(supabaseClient: .development))
}
