//
//  SupabseManager.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/13.
//

import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    let client: SupabaseClient



    private init() {
        guard let supabaseUrl = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
              let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_API_KEY") as? String else {
            fatalError("Missing Supabase configuration")
        }
        self.client = SupabaseClient(supabaseURL: URL(string: supabaseUrl)!, supabaseKey: supabaseKey)
    }
}
