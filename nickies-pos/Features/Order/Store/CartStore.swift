//
//  CartStore.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import Foundation
import Supabase

@Observable
class CartStore {
  
  var supabaseClient: SupabaseClient
  var cartItems: [CartItem] = []
  var products: [Product] = []
  var receivedAmount: Double = 0
  
  var totalPrice: Double {
    cartItems.reduce(0) { $0 + $1.product.price * Double($1.count) }
  }
  
  
  var change: Double {
    receivedAmount - totalPrice
  }
  
  init(supabaseClient: SupabaseClient) {
    self.supabaseClient = supabaseClient
  }
  
  
  func fetchProducts() async throws {
    products = try await supabaseClient
      .from(Constant.productTable)
      .select()
      .execute()
      .value
  }
  
  func addOrder() async throws {
    let newOrder: Order = try await supabaseClient
      .from("orders")
      .insert(["status": "Pending"])
      .select()
      .single()
      .execute()
      .value
    
    for cartItem in cartItems {
      try await supabaseClient
        .from(Constant.orderItemsTable)
        .insert(["product_id": cartItem.product.id,
                 "order_id": newOrder.id,
                 "amount": cartItem.count
                ])
        .execute()
    }
  }
}
