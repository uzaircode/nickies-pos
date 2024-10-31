//
//  AddInventoryScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 28/10/2024.
//

import SwiftUI

struct AddInventoryScreen: View {
  @Environment(\.supabaseClient) private var supabaseClient
  @State private var item: String = ""
  @State private var cost: Double = 0.0
  @State private var quantity: Int = 0
  
  func addItem() async {
    return
  }
  
  var body: some View {
    VStack() {
      TextField("Enter item name", text: $item )
        .autocorrectionDisabled(true)
        .textFieldStyle(.roundedBorder)
      TextField("Enter the cost per item", text: $item)
        .autocorrectionDisabled(true)
        .textFieldStyle(.roundedBorder)
      TextField("Enter the quantity", text: $item )
        .autocorrectionDisabled(true)
        .textFieldStyle(.roundedBorder)
      Button {
      } label: {
        Text("Add Item")
          .fontWeight(.medium)
          .foregroundStyle(.black)
          .frame(maxWidth: .infinity)
          .frame(height: 50)
          .background(Color.white)
          .foregroundStyle(Color.white)
          .cornerRadius(30)
      }
      
    }
    .padding()
  }
}

#Preview {
  AddInventoryScreen()
    .environment(\.supabaseClient, .development)
}
