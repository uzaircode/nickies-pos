//
//  OrderItems.swift
//  nickies-pos
//
//  Created by Nik Uzair on 07/11/2024.
//

import Foundation

struct OrderItems: Codable {
  var id: Int?
  let productId: Int
  let orderId: Int
  let amount: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case productId = "product_id"
    case orderId = "order_id"
    case amount
  }
}
