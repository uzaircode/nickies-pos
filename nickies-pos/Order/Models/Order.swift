//
//  Order.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import Foundation

struct Order: Codable, Identifiable {
  let id: Int
  let productId: UUID 
}


