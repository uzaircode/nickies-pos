//
//  CustomerDetailScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct CustomerDetailScreen: View {
  let customer: Customer
  
  var body: some View {
    Text(customer.name)
  }
}

#Preview {
  CustomerDetailScreen(customer: Customer(name: "nikuzair", phoneNumber: 018900241, address: nil, note: "test"))
}
