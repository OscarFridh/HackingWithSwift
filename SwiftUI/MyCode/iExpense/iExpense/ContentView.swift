//
//  ContentView.swift
//  iExpense
//
//  Created by Oscar Fridh on 2022-10-03.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var user = {
        if let data = UserDefaults.standard.data(forKey: "UserData") {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                return user
            }
        }
        return User(firstName: "Taylor", lastName: "Swift")
    }()
    
    var body: some View {
        VStack {
            Text("\(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
