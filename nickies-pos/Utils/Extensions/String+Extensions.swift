//
//  String+Extensions.swift
//  nickies-pos
//
//  Created by Nik Uzair on 02/11/2024.
//

import Foundation

//https://www.youtube.com/watch?v=n5X_V81OYnQ&ab_channel=PaulHudson
//extension
extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  mutating func trim() {
    self = self.trimmed()
  }
}
