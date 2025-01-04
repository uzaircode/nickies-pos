//
//  Double+Extensions.swift
//  nickies-pos
//
//  Created by Nik Uzair on 30/12/2024.
//

import Foundation

extension Double {
  var roundedToNearest05: Double {
    guard self == self else { return self }
    return ceil(self)
  }
  var roundedTo10: Double {
    return (self / 10).rounded(.up) * 10
  }
  var roundedTo50: Double {
    guard self < 50 else { return self }
    return (self / 50).rounded(.up) * 50
  }
  var roundedTo100: Double {
    return (self / 100).rounded(.up) * 100
  }
}
