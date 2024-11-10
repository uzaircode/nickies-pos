//
//  Order.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import Foundation

struct Order: Codable, Identifiable {
  var id: Int?
  let status: String
}
