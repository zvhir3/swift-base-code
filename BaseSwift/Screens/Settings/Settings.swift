//
//  Settings.swift
//  BaseSwift
//
//  Created by Nightfall Nest on 14/05/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var email: String = "hello@zahiruddin.com"
    @State private var name: String =  "Zahiruddin Zainal"
    
    @State private var showingDeleteActionSheet = false
    @State private var showingLogoutActionSheet = false
    @State var isDarkModeEnabled: Bool = true
    @State private var isLoggedIn: Bool = true
    @State private var isCacheCleared = false
    @State private var showCacheAlert = false
    @State private var isDataCleared = false
    @State private var showDataAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: EmptyView()) {
                    Group {
                        HStack{
                            Image("ImgProfile")
                                .resizable()
                                .frame(width:50, height: 50, alignment: .center)
                                .foregroundColor(.blue)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(name)
                                    .font(.subheadline)
                                    .bold()
                                Text(email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 4)
                        }
                    }
                    
                }
                
                Section(header: Text("ACCOUNT SETTINGS")) {
                    NavigationLink(destination: Text("Account Preferences")) {
                        HStack{
                            Image(systemName: "lock")
                            Text("Account Preferences")
                        }
                    }
                    Button(action: {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        HStack {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                            Text("Notifications")
                                .foregroundColor(.primary)
                            Spacer()
                        }
                    }
                    
                }
                
                Section(header: Text("SUBSCRIPTION")) {
                    NavigationLink(destination: Text("Subscription")) {
                        HStack{
                            Image(systemName: "star.circle")
                                .foregroundColor(.primary)
                            Text("Subscribe")
                        }
                    }
                }
                
                Section(header: Text("CUSTOMIZATIONS")) {
                    NavigationLink(destination: Text("Theme")) {
                        HStack{
                            Image(systemName: "paintbrush")
                            Text("Change Theme")
                        }
                    }
                    NavigationLink(destination: Text("Language")) {
                        HStack{
                            Image(systemName: "quote.bubble")
                            Text("Change Language")
                        }
                    }
                    NavigationLink(destination: Text("Country")) {
                        HStack{
                            Image(systemName: "flag")
                            Text("Change Country")
                        }
                    }
                    HStack{
                        Image(systemName: "moon.stars")
                        Toggle(isOn: $isDarkModeEnabled) {
                            Text("Dark Mode")
                        }
                    }
                }
                
                Section(header: Text("ABOUT US")) {
                    Link(destination: URL(string: "https:/zahiruddin.com")!) {
                        HStack{
                            Image(systemName: "info.circle")
                                .foregroundColor(.primary)
                            Text("About")
                                .foregroundColor(.primary)
                        }
                    }
                    Link(destination: URL(string: "https:/zahiruddin.com")!) {
                        HStack{
                            Image(systemName: "phone")
                                .foregroundColor(.primary)
                            Text("Contact Us")
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                Section(header: Text("ACTIONS")) {
                    Button(action: {
                        self.showingDeleteActionSheet = true
                    }) {
                        Text("Delete Account")
                            .foregroundColor(.red)
                    }
                    .actionSheet(isPresented: $showingDeleteActionSheet) {
                        ActionSheet(
                            title: Text("Delete Account"),
                            message: Text("Choose an option"),
                            buttons: [
                                .destructive(Text("Permanently Delete")) {
                                    // Handle permanently delete action
                                },
                                .default(Text("Temporary Delete")) {
                                    // Handle temporary delete action
                                },
                                .cancel()
                            ]
                        )
                    }
                    
                    Button(action: {
                        self.showingLogoutActionSheet = true
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    .actionSheet(isPresented: $showingLogoutActionSheet) {
                        ActionSheet(
                            title: Text("Logout"),
                            message: Text("You are about to logout"),
                            buttons: [
                                .destructive(Text("Logout")) {
                                    // TODO: DELETE DATA
                                    isLoggedIn = false
                                },
                                .cancel()
                            ]
                        )
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        .onAppear {
            // TODO: FETCH API
        }
        .fullScreenCover(isPresented: Binding<Bool>(
            get: { !$isLoggedIn.wrappedValue },
            set: { _ in }
        )) {
            // TODO: GO TO LOGIN
            // Login()
        }
        .transaction({ transaction in
            transaction.disablesAnimations = true
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
