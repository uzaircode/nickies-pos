//
//  CartMoreScreen.swift
//  nickies-pos
//
//  Created by Nik Uzair on 10/11/2024.
//

import SwiftUI

struct CartMoreScreen: View {
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    NavigationView {
      List {
        Section("Cart") {
          NavigationLink {
            NotesScreen()
          } label: {
            HStack {
              Label("Notes", systemImage: "square.and.pencil")
            }
          }
        }
      }
      .listStyle(.insetGrouped)
      .navigationTitle("More Actions")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Dismiss") {
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  CartMoreScreen()
}
