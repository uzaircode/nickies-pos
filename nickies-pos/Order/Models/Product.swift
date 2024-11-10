//
//  Product.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import Foundation

struct Product: Codable, Identifiable {
  var id: Int
  var name: String
  var price: Double
}
