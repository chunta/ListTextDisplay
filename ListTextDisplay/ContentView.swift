//
//  ContentView.swift
//  ListTextDisplay
//
//  Created by apple on 2023/11/9.
//

import SwiftUI

enum AppearanceStyle: String, CaseIterable, Identifiable {
    case dark, light, auto
    
    var id: String { rawValue }
}

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var isPrivate: Bool = true
    @State private var fontSize: CGFloat = 5
    @State private var appearance: AppearanceStyle = .auto
    
    var preferredColorScheme: ColorScheme? {
        switch appearance {
        case .dark:
            return .dark
        case .light:
            return .light
        case .auto:
            return nil
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Username", text: $username)
                    Toggle("Private Account", isOn: $isPrivate)
                    Button {
                        print(25)
                    } label: {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu")
                            .lineLimit(nil)
                            .foregroundColor(Color(UIColor.myControlBackground))
                        
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu")
                        .lineLimit(nil)
                } header: { Text("Profile") }
                
                Section {
                    Slider(value: $fontSize, in: 1...10) {
                        Label("Default Font Size", systemImage: "text.magnifyingglass")
                    }
                    
                    Picker("Appearance", selection: $appearance) {
                        Text("Dark").tag(AppearanceStyle.dark)
                        Text("Light").tag(AppearanceStyle.light)
                        Text("Auto").tag(AppearanceStyle.auto)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: { Text("Appearance") }
                
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.2.1")
                    }
                } header: { Text("ABOUT") }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(preferredColorScheme) // Apply the theme dynamically
        }
    }
}

#Preview {
    ContentView()
}

