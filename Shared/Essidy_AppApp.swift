//
//  Essidy_AppApp.swift
//  Shared
//
//  Created by Lluís Colomer Coll on 30/4/22.
//

import SwiftUI
import Firebase

@main
struct Essidy_AppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainPage()
        }
    }
}
