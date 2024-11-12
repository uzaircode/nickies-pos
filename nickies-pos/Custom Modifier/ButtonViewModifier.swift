//
//  ButtonViewModifier.swift
//  nickies-pos
//
//  Created by Nik Uzair on 10/11/2024.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
  var isDisabled: Bool
  
  func body(content: Content) -> some View {
    content
      .fontWeight(.medium)
      .foregroundColor(.black)
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(isDisabled ? Color.gray : Color.white)
      .cornerRadius(30)
      .padding()
      .disabled(isDisabled)
  }
}


extension View {
  func applyButtonStyle(isDisabled: Bool) -> some View {
    self.modifier(ButtonViewModifier(isDisabled: isDisabled))
  }
}
