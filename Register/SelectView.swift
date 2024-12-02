//
//  SwiftUIView.swift
//  Register
//
//  Created by Thapat Auechaikasem on 18/11/67.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        NavigationStack {
            Text("App Name")
                .font(.title)
                .fontDesign(.rounded)
            NavigationLink(destination: LoginView()) {
                Text("Login")
                    .frame(maxWidth: .infinity ,maxHeight: 50)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(10)))
                    .padding(.horizontal, 30)
                    
            }
            NavigationLink(destination: RegisterView()) {
                Text("Register")
                    .frame(maxWidth: .infinity ,maxHeight: 50)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(10)))
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    SelectView()
}
