//
//  SignUpView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI

struct SignUpView: View {
    
    
    @State var firstName: String = ""
    
    @State var lastName: String = ""
    
    @State var email: String = ""
    
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("SignUp")
                .foregroundColor(.red)
                .font(.system(size: 36 ,weight: .black, design: .serif))
                .padding(.bottom,30)
            Image("newbg")
                .resizable()
            .frame(width: 150.0, height: 150.0)
            .padding(.bottom,30)
            
            TextField("First Name",text: $firstName)
                .textFieldStyle(.roundedBorder )
                .padding()
            
            TextField("Last Name",text: $lastName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("Email",text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("Password",text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
            } label: {
              Text("Sign Up")
                    .foregroundColor(Color.white)
            }
            .background(Color.red)
            .buttonStyle(.bordered)

        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
