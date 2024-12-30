//
//  AddCustomerScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct AddCustomerScreen: View {
  
  @State private var name: String = ""
  @State private var phoneNumber: Int?
  @State private var note: String = ""
  @Environment(CustomerStore.self) private var store
  @Environment(\.dismiss) private var dismiss
  
  private func saveCustomer() async {
    let customer = Customer(name: name, phoneNumber: phoneNumber ?? 0, address: nil, note: note)
    do {
      try await store.addCustomer(customer)
      dismiss()
    } catch {
      print(error)
    }
  }
  
  var body: some View {
    Form {
      TextField("First Name", text: $name)
        .autocorrectionDisabled(false)
      TextField("Phone Number", value: $phoneNumber, formatter: NumberFormatter())
        .keyboardType(.numberPad)
      TextField("Note", text: $note)
      Button("Save") {
        Task {
          await saveCustomer()
        }
      }
    }
  }
}

#Preview {
  AddCustomerScreen()
    .environment(CustomerStore(supabaseClient: .development))
}
