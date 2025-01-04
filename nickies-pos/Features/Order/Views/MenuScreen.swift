//
//  ContentView.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct MenuScreen: View {
  
  @Environment(CartStore.self) private var store
  @State private var showSheetView = false
  
  private var totalItemCount: Int {
    store.cartItems.reduce(0) { $0 + $1.count }
  }
  private let fixedColumn = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  private func addToCart(product: Product) async {
    if let index = store.cartItems.firstIndex(where: { $0.product.id == product.id }) {
      store.cartItems[index].count += 1
      print("Updated existing item: \(store.cartItems[index])")
    } else {
      let newItem = CartItem(product: product, count: 1)
      store.cartItems.append(newItem)
      print("Added new item: \(newItem)")
    }
    print("Current Cart Items: \(store.cartItems)")
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        ScrollView {
          LazyVGrid(columns: fixedColumn) {
            ForEach(store.products, id: \.id) { product in
              VStack {
                Text(product.name)
                  .foregroundColor(.white)
                  .font(.title)
                  .padding(.bottom, 4)
                Text("$\(product.price, specifier: "%.2f")")
                  .font(.subheadline)
                  .foregroundColor(.white)
              }
              .frame(alignment: .center)
              .padding()
              .background(Color.blue)
              .cornerRadius(10)
              .frame(height: 140)
              .onTapGesture {
                Task {
                  await addToCart(product: product)
                }
              }
            }
          }
          .padding(.bottom)
        }
        Button(action: {
          showSheetView.toggle()
        }) {
          Text(store.cartItems.isEmpty ? "Add to Cart" : "\(totalItemCount) items - RM \(store.totalPrice, specifier: "%.2f")")
        }
        .applyButtonStyle(isDisabled: false)
      }
      .padding(.vertical)
      .navigationTitle("Nickies POS")
      .onAppear {
        Task {
          do {
            try await store.fetchProducts()
          } catch {
            print(error)
          }
        }
      }
    }
    .sheet(isPresented: $showSheetView) {
      CartItemScreen()
    }
  }
}

#Preview {
  MenuScreen()
    .environment(CartStore(supabaseClient: .development))
}
