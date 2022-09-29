//
//  LoginView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .foregroundColor(.red)
                .font(.system(size: 36 ,weight: .black, design: .serif))
                .padding(.bottom,30)
            Image("newbg")
                .resizable()
            .frame(width: 150.0, height: 150.0)
            .padding(.bottom,30)
            
            TextField("Email",text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("Password",text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
            } label: {
              Text("Login")
                    .foregroundColor(Color.white)
            }
            .background(Color.red)
            .buttonStyle(.bordered)

        }
        
    }}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
