//
//  CustomerScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import SwiftUI

struct CustomerScreen: View {
  @Environment(CustomerStore.self) private var store
  @State private var showSheetView: Bool = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(store.customers) { customer in
          NavigationLink {
            CustomerDetailScreen(customer: customer)
          } label: {
            VStack(alignment: .leading) {
              Text(customer.name)
              Text("\(customer.phoneNumber)")
            }
          }
        }
      }
      .navigationTitle("Customer")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showSheetView.toggle()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $showSheetView, content: {
        AddCustomerScreen()
      })
      .task {
        do {
          try await store.fetchCustomer()
        } catch {
          print(error)
        }
      }
    }
  }
}

#Preview {
  CustomerScreen()
    .environment(CustomerStore(supabaseClient: .development))
}
