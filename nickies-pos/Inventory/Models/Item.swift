//
//  Item.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import Foundation

struct Item: Codable, Identifiable {
  var id: Int
  var name: String
  var cost: Double
  var quantity: Int
}
