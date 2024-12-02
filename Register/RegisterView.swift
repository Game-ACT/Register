//
//  ContentView.swift
//  Register
//
//  Created by Thapat Auechaikasem on 29/10/67.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var comfirmpassword: String = ""
    @State var error: String = ""
    
    func register() {
        error = ""
        if password != comfirmpassword {
            error = "Unmatched Password"
        } else if username == "" || password == "" {
            error = "Please enter all fields."
        } else {
            // register
        }
    }
    
    var body: some View {
        Text("Register")
            .font(.title)
            .fontDesign(.rounded)
        TextField("Username", text: $username)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding(.horizontal,20)
            .autocorrectionDisabled()
        TextField("Email", text: $email)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding(.horizontal,20)
            .autocorrectionDisabled()
        SecureField("Password", text: $password)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding(.horizontal,20)
        SecureField("Confirm Password", text: $comfirmpassword)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding(.horizontal,20)
        Button(action: register){
            Text("Register")
                .frame(width: 100, height: 50)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(10)))
        }
        
        Text(error)
            .fontWeight(.bold)
            .foregroundStyle(.red)
        
    }
    
}

#Preview {
    RegisterView()
}
