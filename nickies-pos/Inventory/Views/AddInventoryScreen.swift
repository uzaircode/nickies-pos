//
//  AddInventoryScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 28/10/2024.
//

import SwiftUI

struct AddInventoryScreen: View {
  @Environment(\.supabaseClient) private var supabaseClient
  @Environment(\.dismiss) private var dismiss
  
  @State private var name: String = ""
  @State private var quantity: Int = 0
  
  @Binding var items: [InventoryItem]
  
  private func saveItem() async {
    let item = InventoryItem(name: name, quantity: quantity)
    do {
      let newItem: InventoryItem = try await supabaseClient
        .from(Constant.itemTable)
        .insert(item)
        .select()
        .single()
        .execute()
        .value
      
      items.append(newItem)
      
      dismiss()
    } catch {
      print(error)
    }
  }
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Enter item name", text: $name )
          .autocorrectionDisabled(true)
          .textFieldStyle(.roundedBorder)
        TextField("Enter the quantity", value: $quantity, format: .number)
          .autocorrectionDisabled(true)
          .textFieldStyle(.roundedBorder)
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Close") {
            dismiss()
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Button("Save") {
            Task {
              await saveItem()
            }
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    AddInventoryScreen(items: .constant([]))
  }.environment(\.supabaseClient, .development)
}
