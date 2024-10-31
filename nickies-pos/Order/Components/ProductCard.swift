//
//  ProductCard.swift
//  nickies-pos
//
//  Created by Nik Uzair on 31/10/2024.
//

//import SwiftUI
//
//struct ProductCard: View {
//  var product: Product
//  var onTap: () -> Void
//  
//  var body: some View {
//    VStack {
//      Text(product.name)
//        .foregroundColor(.white)
//        .font(.title)
//        .padding(.bottom, 4)
//      Text("$\(product.price, specifier: "%.2f")")
//        .font(.subheadline)
//        .foregroundColor(.white)
//    }
//    .frame(alignment: .center)
//    .padding()
//    .background(Color.blue)
//    .cornerRadius(10)
//    .frame(height: 140)
//    .onTapGesture {
//      Task {
//        onTap
//      }
//    }
//  }
//}
//
//#Preview {
//  ProductCard(product: Product(id: UUID(), name: "Test Product", price: 10.99)) {
//    print("Product tapped")
//  }
//}
