//
//  CartItemScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

enum PaymentType {
  case Cash
  case QrPayment
}

struct CartItemScreen: View {
  @Environment(\.supabaseClient) private var supabaseClient
  @Environment(\.dismiss) private var dismiss
  @Binding var cartItems: [CartItem]
  @State private var selection: String = "Cash"
  @State private var showMoreSheet: Bool = false
  @State private var preselectedIndex: Int = 0
  @State private var isShowingSheet: Bool = false
  
  private var totalPrice: Double {
    cartItems.reduce(0) { $0 + $1.product.price * Double($1.count) }
  }
  
  private func totalPricePerItem(_ cartItem: CartItem) -> Double {
    return cartItem.product.price * Double(cartItem.count)
  }
  
  private func addOrder() async throws {
    let newOrder: Order = try await supabaseClient
      .from("orders")
      .insert(["status": "Pending"])
      .select()
      .single()
      .execute()
      .value
    print("Cart Items: \(cartItems)")
    
    for cartItem in cartItems {
      print("Inserting Order Item for Product: \(cartItem.product.name), Quantity: \(cartItem.count)")
      try await supabaseClient
        .from("order_items")
        .insert(["product_id": cartItem.product.id,
                 "order_id": newOrder.id,
                 "amount": cartItem.count
                ])
        .execute()
    }
  }
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 0) {
        HStack {
          
          Button(action: {
            showMoreSheet.toggle()
          }) {
            Image(systemName: "ellipsis.circle")
              .resizable()
              .scaledToFit()
              .frame(width: 25, height: 25)
              .foregroundColor(.blue)
          }
          .buttonStyle(PlainButtonStyle())
          .padding(.top)
          Spacer()
          Button(action: {
            cartItems.removeAll()
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
            Text("RM\(cartItem.product.price * Double(cartItem.count), specifier: "%.2f")")
              .font(.title3)
          }
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
          .swipeActions {
            Button(role: .destructive) {
              cartItems.removeAll { $0.id == cartItem.id }
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
        }
        CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Cash", "QR Payment"])
          .padding()
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
//          Task {
//            try await addOrder()
//            cartItems.removeAll()
//            dismiss()
//          }
          isShowingSheet.toggle()
        }) {
          Text("Place Order")
        }
        .applyButtonStyle(isDisabled: cartItems.isEmpty)
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
      .sheet(isPresented: $showMoreSheet) {
        CartMoreScreen()
      }
    }.sheet(isPresented: $isShowingSheet) { CashScreen() }
  }
}

#Preview {
  let sampleProduct = Product(id: 1, name: "Sample Product", price: 15.99)
  let sampleCartItem = CartItem(product: sampleProduct, count: 2)
  
  CartItemScreen(cartItems: .constant([sampleCartItem]))
    .environment(\.supabaseClient, .development)
}