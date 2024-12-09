//
//  MainView.swift
//  Register
//
//  Created by Thapat Auechaikasem on 29/10/67.
//

import SwiftUI

struct MainView: View {
    
    @Binding var username: String
    
    var body: some View {
        Text("Main View")
            .font(.title)
            .fontDesign(.rounded)
        Text("Hello!,  " + self.username)
            .padding()
    }
}
