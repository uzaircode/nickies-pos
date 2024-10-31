//
//  MainTabView.swift
//  nickies-pos
//
//  Created by Nik Uzair on 31/10/2024.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {
    TabView {
      MenuScreen()
        .tabItem {
          Label("Menu", systemImage: "square.grid.2x2")
        }
      InventoryScreen()
        .tabItem {
          Label("Inventory", systemImage: "shippingbox")
        }
    }
  }
}

#Preview {
  MainTabView()
}
