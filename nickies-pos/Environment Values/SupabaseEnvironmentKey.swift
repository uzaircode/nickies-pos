//
//  SupabaseEnvironmentKey.swift
//  nickies-pos
//
//  Created by Nik Uzair on 27/10/2024.
//

import SwiftUI
import Supabase

struct SupabaseEnvironmentKey: EnvironmentKey {
  static var defaultValue: SupabaseClient = .development
}

extension EnvironmentValues {
  var supabaseClient: SupabaseClient {
    get { self[SupabaseEnvironmentKey.self] }
    set { self[SupabaseEnvironmentKey.self] = newValue }
  }
}
