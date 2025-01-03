//
//  nickies_posApp.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI

@main
struct nickies_posApp: App {
    var body: some Scene {
        WindowGroup {
          MainTabView()
            .environment(CustomerStore(supabaseClient: .development))
            .environment(OrderStore(supabaseClient: .development))
            .environment(CartStore(supabaseClient: .development))
        }
    }
}
