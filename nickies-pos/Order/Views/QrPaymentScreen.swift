//
//  QrPaymentScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 10/11/2024.
//

import SwiftUI

struct QrPaymentScreen: View {
  @Environment(\.dismiss) private var dismiss
  @State private var isAnimating = false
  
  var body: some View {
    VStack {
      Image(systemName: "checkmark.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .foregroundColor(.green)
        .padding()
        .opacity(isAnimating ? 1 : 0)
      Text("Please check the QR Payment")
    }
    .onAppear {
      isAnimating.toggle()
    }
    .padding()
    .navigationBarTitle("QR Payment", displayMode: .inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button("Done") {
          dismiss()
        }
      }
    }
  }
}

#Preview {
  QrPaymentScreen()
}
