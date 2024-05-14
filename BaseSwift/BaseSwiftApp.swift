//
//  BaseSwiftApp.swift
//  BaseSwift
//
//  Created by Nightfall Nest on 14/05/2024.
//

import SwiftUI

@main
struct BaseSwiftApp: App {
    @StateObject private var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isUserLoggedIn {
                BottomNavigationView()
            } else {
                LoginView()
            }
        }
    }
}

class AppViewModel: ObservableObject {
    @Published var isUserLoggedIn: Bool = false
    
    init() {
        checkUserLoginStatus()
    }
    
    func checkUserLoginStatus() {
        isUserLoggedIn = isAnyEmailExist()
    }
}
//
//#Preview {
//    if AppViewModel().isUserLoggedIn {
//        BottomNavigationView()
//    } else {
//        LoginView()
//    }
//}
