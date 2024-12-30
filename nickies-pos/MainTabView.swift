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
      OrderScreen()
        .tabItem {
          Label("Order", systemImage: "cube.box")
        }
      CustomerScreen()
        .tabItem {
          Label("Customer", systemImage: "person")
        }
      SettingScreen()
        .tabItem {
          Label("Setting", systemImage: "gearshape")
        }
    }
    .onAppear() {
      UITabBar.appearance().backgroundColor = .systemGray6
    }
  }
}

#Preview {
  MainTabView()
}
