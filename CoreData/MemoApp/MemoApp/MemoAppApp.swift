//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 김소진 on 12/3/24.
//

import SwiftUI

@main
struct MemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            MemoListView()
                .environmentObject(MemoRepository())
        }
    }
}
