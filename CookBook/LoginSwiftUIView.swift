//
//  LoginSwiftUIView.swift
//  mobileSwiftUI
//
//  Created by ITIT on 03/03/25.
//

import SwiftUI

struct LoginSwiftUIView: View {
    @State private var user: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Log In")
                .font(.title)
                .padding(.bottom, 20)

            VStack {
                VStack(alignment: .leading) {
                    Text("Username:")
                    TextField("Username", text: $user)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                VStack(alignment: .leading) {
                    Text("Password:")
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Button("Log In") {
                    
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.orange)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
            }
            .frame(maxWidth: 350)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoginSwiftUIView()
}

