//
//  CustomSegmentedControl.swift
//  nickies-pos
//
//  Created by Nik Uzair on 10/11/2024.
//

import SwiftUI

struct CustomSegmentedControl: View {
  @Binding var preselectedIndex: Int
  var options: [String]
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(options.indices, id:\.self) { index in
        ZStack {
          Rectangle()
            .fill(.white.opacity(0.2))
          
          Rectangle()
            .fill(.white)
            .cornerRadius(20)
            .padding(2)
            .opacity(preselectedIndex == index ? 1 : 0.01)
            .onTapGesture {
              withAnimation(.interactiveSpring()) {
                preselectedIndex = index
              }
            }
        }
        .overlay(
          Text(options[index])
            .foregroundColor(preselectedIndex == index ? .black : .gray)
            .fontWeight(.medium)
        )
      }
    }
    .frame(height: 50)
    .cornerRadius(20)
  }
}
