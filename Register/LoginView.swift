//
//  RegisterView.swift
//  Register
//
//  Created by Thapat Auechaikasem on 18/11/67.
//

import SwiftUI

struct User {
    var username: String
    var password: String
    var additinfo: [String]
}

func loadCSV(from filename: String) -> [User]? {
    
    // guard is like try except in python
    guard let filepath = Bundle.main.path(forResource: filename, ofType: "csv") else {
        print("[FATAL] CSV NOT FOUND")
        return nil
    }
    
    do {
        let content = try String(contentsOfFile: filepath)
        let rows = content.components(separatedBy: "\n").filter
        {
            !$0.isEmpty
        }
        //var?
        var users : [User] = []
        
        for row in rows {
            let columns = row.components(separatedBy: ",")
            // unneeded checkvalve
            if columns.count >= 2 {
                let username =  columns[0].trimmingCharacters(in: .whitespacesAndNewlines)
                let password = columns[1].trimmingCharacters(in: .whitespacesAndNewlines)
                let additinfo = Array(columns.dropFirst(2))
                users.append(User(username: username, password: password, additinfo: additinfo))
            }
        }
        
        return users
    } catch {
        print("[FATAL] ERROR PARSE")
        return nil
    }
}

func login(users: [User], username: String, password: String) -> User? {
    return users.first { $0.username == username && $0.password == password}
}


struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var loginSuccess: Bool = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .fontDesign(.rounded)
            
            Form {
                Section(header: Text("Username")) {
                    TextField("Enter Your Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Password")) {
                    SecureField("Enter Your Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                
            }
            .padding()
            
            Button(action: {
                if let users = loadCSV(from: "users") {
                    if let _ = login(users: users, username: username, password: password) {
                        loginSuccess = true
                    } else {
                        loginSuccess = false
                    }
                }
                showAlert = true
                
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(10)))
                    .foregroundStyle(.white)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text(loginSuccess ? "Login Success" : "Login Failed"),
                  message: Text(loginSuccess ? "Welcome \(username)" : "Invalid username or password"),
                      dismissButton: .default(Text("Dismiss"))
                )
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
