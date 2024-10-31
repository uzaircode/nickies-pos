//
//  CartItemScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI

struct CartItemScreen: View {
  var body: some View {
    VStack {
      List {
      }
    }
    .safeAreaInset(edge: VerticalEdge.bottom) {
      VStack {
        Button {
          print("Place order...")
        } label: {
          Text("Place Order")
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
          
        }
        .padding(.horizontal)
        .cornerRadius(10)
        .buttonStyle(.borderedProminent)
      }
    }
  }
}

#Preview {
  CartItemScreen()
}
