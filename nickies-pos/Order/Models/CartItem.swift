//
//  CartItem.swift
//  nickies-pos
//
//  Created by Nik Uzair on 31/10/2024.
//

import Foundation

struct CartItem: Identifiable {
  var id: Int?
  var product: Product
  var count: Int
  
  init(product: Product, count: Int) {
    self.product = product
    self.count = count
    self.id = product.id
  }
}
