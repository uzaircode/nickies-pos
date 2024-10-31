//
//  InventoryItem.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import Foundation

struct InventoryItem: Codable, Identifiable {
  var id: Int?
  let name: String
  let quantity: Int
}
