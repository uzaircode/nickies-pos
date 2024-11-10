//
//  InventoryScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct InventoryScreen: View {
  
  @State private var search = ""
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
  
  //please check with Mohammad Azam
  private func deleteItem(at offsets: IndexSet) {
    for index in offsets {
      let itemToDelete = items[index]
      Task {
        do {
          try await supabaseClient
            .from(Constant.itemTable)
            .delete()
            .eq("id", value: itemToDelete.id)
            .execute()
          // Remove the item from the local list
          items.remove(at: index)
        } catch {
          print(error)
        }
      }
    }
  }
  
  var searchResult: [InventoryItem] {
    if search.isEmpty {
      return items
    } else {
      return items.filter { $0.name.lowercased().hasPrefix(search.lowercased().trimmed()) }
    }
  }
  
  var body: some View {
    NavigationStack {
      List{
        ForEach(searchResult) { item in
          HStack {
            Text(item.name)
            Spacer()
            Text("\(item.quantity)")
          }
        }
        .onDelete(perform: deleteItem)
      }.task {
        await fetchItems()
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add") {
            isPresented = true
          }
        }
      }
      .searchable(text: $search)
      .autocorrectionDisabled(true)
      .textInputAutocapitalization(.never)
      .navigationTitle("Inventory")
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
