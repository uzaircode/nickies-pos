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
  @State private var selectedProductId: [UUID?] = []
  @State private var products: [Product] = []
  @State private var orders: [Order] = []
  @State var showSheetView = false
  
  private func fetchProducts() async {
    do {
      products = try await supabaseClient
        .from("products")
        .select()
        .execute()
        .value
    } catch {
      print(error)
    }
  }
  
  private func insertOrder() async {
    do {
      guard let selectedProductId = selectedProductId.first,
            let product = products.first(where: { $0.id == selectedProductId }) else {
        print("Product not found")
        return
      }
      try await supabaseClient.from("orders").insert([
        "product_id": product.id.uuidString
      ]).execute()
      
      let order = Order(id: UUID().hashValue, productId: product.id)
      orders.append(order)
    } catch {
      print("Error inserting order:", error)
    }
  }
  
  private let fixedColumn = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: fixedColumn) {
          ForEach(products, id: \.id) { product in
            VStack {
              Text(String(product.name))
                .foregroundColor(.white)
                .font(.title)
                .padding(.bottom, 4)
              Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.white)
            }
            .frame(alignment: .center)
            .padding()
            .background(selectedProductId.contains(product.id) ? Color.blue : Color.gray)
            .cornerRadius(10)
            .frame(height: 140)
            .onTapGesture {
              if let index = selectedProductId.firstIndex(where: { $0 == product.id }) {
                selectedProductId.remove(at: index)
              } else {
                selectedProductId.append(product.id)
              }
            }
          }
        }
        .padding(.bottom)
        Button {
          showSheetView.toggle()
          Task {
            await insertOrder()
          }
        } label: {
          Text("Place Order")
            .fontWeight(.medium)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white)
            .foregroundStyle(Color.white)
            .cornerRadius(30)
        }
      }
      .padding(.horizontal)
      .navigationTitle("Nickies POS")
      .onAppear {
        Task {
          await fetchProducts()
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
    .environment(\.supabaseClient, .development)
}
