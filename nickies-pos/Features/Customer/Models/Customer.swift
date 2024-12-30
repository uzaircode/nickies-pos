//
//  Customer.swift
//  nickies-pos
//
//  Created by Nik Uzair on 13/12/2024.
//


struct Customer: Codable, Identifiable {
  var id: Int?
  let name: String
  let phoneNumber: Int
  let address: Address?
  let note: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case phoneNumber = "phone_number"
    case address
    case note
  }
}

struct Address: Codable {
  let addressLine: String
  let postalCode: Int
  let city: String
}
