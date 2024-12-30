//
//  CustomerStore.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import Foundation
import Supabase

@Observable
class CustomerStore {
  
  var customers: [Customer] = []
  var supabaseClient: SupabaseClient
  
  init(supabaseClient: SupabaseClient) {
    self.supabaseClient = supabaseClient
  }
  
  func fetchCustomer() async throws {
    customers = try await supabaseClient
      .from("customers")
      .select()
      .execute()
      .value
  }
  
  func addCustomer(_ customer: Customer) async throws {
    let newCustomer: Customer = try await supabaseClient
      .from("customers")
      .insert(customer)
      .select()
      .single()
      .execute()
      .value
    
    customers.append(newCustomer)
  }
}
