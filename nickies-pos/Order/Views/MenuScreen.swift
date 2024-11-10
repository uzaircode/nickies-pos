//
//  ContentView.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct MenuScreen: View {
  
  @Environment(\.supabaseClient) private var supabaseClient
  @State private var products: [Product] = []
  @State private var cartItems: [CartItem] = []
  @State private var showSheetView = false
  private var totalPrice: Double {
    cartItems.reduce(0) { $0 + $1.product.price * Double($1.count)}
  }
  private var totalItemCount: Int {
    cartItems.reduce(0) { $0 + $1.count }
  }
  private let fixedColumn = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  private func fetchProducts() async {
    do {
      products = try await supabaseClient
        .from(Constant.productTable)
        .select()
        .execute()
        .value
    } catch {
      print(error)
    }
  }
  
  private func addToCart(product: Product) async {
    if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
      cartItems[index].count += 1
      print("Updated existing item: \(cartItems[index])")
    } else {
      let newItem = CartItem(product: product, count: 1)
      cartItems.append(newItem)
      print("Added new item: \(newItem)")
    }
    print("Current Cart Items: \(cartItems)")
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        ScrollView {
          LazyVGrid(columns: fixedColumn) {
            ForEach(products, id: \.id) { product in
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
        Spacer()
        Button(action: {
          showSheetView.toggle()
        }) {
          Text(cartItems.isEmpty ? "Add to Cart" : "\(totalItemCount) items - RM \(totalPrice, specifier: "%.2f")")
            .fontWeight(.medium)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(30)
        }
      }
      .padding(.vertical)
      .navigationTitle("Nickies POS")
      .onAppear {
        Task {
          await fetchProducts()
        }
      }
    }
    .sheet(isPresented: $showSheetView) {
      CartItemScreen(cartItems: $cartItems)
    }
  }
}

#Preview {
  MenuScreen()
    .environment(\.supabaseClient, .development)
}
