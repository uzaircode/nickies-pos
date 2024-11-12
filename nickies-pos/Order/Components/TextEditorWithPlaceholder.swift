//
//  TextEditorWithPlaceholder.swift
//  nickies-pos
//
//  Created by Nik Uzair on 10/11/2024.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
  @Binding var text: String
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        VStack {
          Text("Notes about the order...")
            .padding(.top, 10)
            .padding(.leading, 10)
            .opacity(2.0)
            .bold()
          Spacer()
        }
      }
      VStack {
        TextEditor(text: $text)
          .scrollContentBackground(.hidden)
          .autocorrectionDisabled()
          .frame(height: 150)
          .background(Color(.systemGray5))
          .cornerRadius(10)
          .opacity(text.isEmpty ? 0.85 : 1)
        Spacer()
      }
    }
    .padding(10)
    .cornerRadius(20)
  }
}


#Preview {
  TextEditorWithPlaceholder(text: .constant("Please give me less ice!"))
}
