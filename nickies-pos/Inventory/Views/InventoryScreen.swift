//
//  InventoryScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct InventoryScreen: View {
  
  @Environment(\.supabaseClient) private var supabaseClient
  @State private var isPresented: Bool = false
  @State private var items: [InventoryItem] = []
  
  private func fetchItems() async {
    do {
      items = try await supabaseClient
        .from(Constant.itemTable)
        .select()
        .execute()
        .value
    } catch {
      print(error)
    }
  }
  
  var body: some View {
    NavigationStack {
      List(items) { item in
        ItemCellView(item: item)
      }.task {
        await fetchItems()
      }
      .navigationTitle("Inventory")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add") {
            isPresented = true
          }
        }
      }
    }
    .sheet(isPresented: $isPresented) {
      AddInventoryScreen(items: $items)
    }
  }
}

#Preview {
  NavigationStack {
    InventoryScreen()
  }.environment(\.supabaseClient, .development)
}

struct ItemCellView: View {
  let item: InventoryItem
  
  var body: some View {
    HStack {
      Text(item.name)
      Spacer()
      Text("\(item.quantity)")
    }
  }
}
