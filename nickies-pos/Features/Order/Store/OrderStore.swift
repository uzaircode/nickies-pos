//
//  OrderStore.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import Foundation
import Supabase

@Observable
class OrderStore {
  
  var supabaseClient: SupabaseClient
  var orders: [Order] = []
  
  init(supabaseClient: SupabaseClient) {
    self.supabaseClient = supabaseClient
  }
  
  
  func fetchOrders() async throws {
    orders = try await supabaseClient
      .from(Constant.orderTable)
      .select()
      .order("created_at", ascending: false)
      .execute()
      .value
  }
}
