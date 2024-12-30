//
//  String+Extensions.swift
//  nickies-pos
//
//  Created by Nik Uzair on 02/11/2024.
//

import Foundation

extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  mutating func trim() {
    self = self.trimmed()
  }
}
