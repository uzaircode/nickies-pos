//
//  CartItemScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct CartItemScreen: View {
  @Environment(\.supabaseClient) private var supabaseClient
  @Environment(\.dismiss) private var dismiss
  @Binding var cartItems: [CartItem]
  
  private func removeAllCartItem(_ cartItem: [CartItem]) {
    cartItems.removeAll()
  }
  private func removeCartItem(_ cartItem: CartItem) {
    cartItems.removeAll { $0.id == cartItem.id}
  }
  
  private var totalPrice: Double {
    cartItems.reduce(0) { $0 + $1.product.price * Double($1.count) }
  }
  
  private func totalPricePerItem(_ cartItem: CartItem) -> Double {
    return cartItem.product.price * Double(cartItem.count)
  }
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 0) {
        HStack {
          Spacer()
          Button(action: {
            removeAllCartItem(cartItems)
          }) {
            Image(systemName: "trash")
              .resizable()
              .scaledToFit()
              .frame(width: 25, height: 25)
              .foregroundColor(.red)
          }
          .buttonStyle(PlainButtonStyle())
          .padding(.top)
        }
        .padding(.horizontal)
        List(cartItems) { cartItem in
          HStack {
            Text(cartItem.product.name)
              .font(.title3)
              .padding(.trailing, 5)
            Text("x\(cartItem.count)")
              .foregroundColor(.gray)
            Spacer()
            Text("RM\(totalPricePerItem(cartItem), specifier: "%.2f")")
              .font(.title3)
          }
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
          .swipeActions {
            Button(role: .destructive) {
              removeCartItem(cartItem)
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
        }
        Divider()
        HStack {
          Text("Total Price")
            .font(.headline)
          Spacer()
          Text("RM\(totalPrice, specifier: "%.2f")")
            .font(.headline)
        }
        .padding()
        Button(action: {
        }) {
          Text("Place Order")
            .fontWeight(.medium)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(cartItems.isEmpty ? Color.gray : Color.white)
            .cornerRadius(30)
            .padding()
        }
        .disabled(cartItems.isEmpty)
      }
      .navigationTitle("Cart")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {
            dismiss()
          }) {
            Text("Dismiss")
              .foregroundColor(.blue)
          }
        }
      }
    }
  }
}

#Preview {
    // Create a sample product and cart item
    let sampleProduct = Product(id: UUID(), name: "Sample Product", price: 15.99)
    let sampleCartItem = CartItem(product: sampleProduct, count: 2)
    
    // Pass the sample cart item to the preview
    CartItemScreen(cartItems: .constant([sampleCartItem]))
        .environment(\.supabaseClient, .development)
}
