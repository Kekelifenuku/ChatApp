//
//  LoginView.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/4/23.
//

import SwiftUI
import Firebase
struct LoginView: View {
  @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                //                text
                Spacer()
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .font (.subheadline)
                        .padding(12)
                        .background (Color( .systemGray6))
                        .cornerRadius (10)
                        .padding(.horizontal,24)
                    SecureField("Enter your password", text: $viewModel.password)
                        .font (.subheadline)
                        .padding(12)
                        .background (Color( .systemGray6))
                        .cornerRadius (10)
                        .padding(.horizontal,24)
                    
                }
                //                forgotten pass
                
                
                Button {
                    print ("forgot password")
                }label: {
                    
                    Text ("Forgot password?")
                        .font (. footnote)
                        . fontWeight (.semibold)
                        .padding (.top)
                        .padding (.leading, 200)
                }
//                        .frame(minWidth: .infinity ,alignment: .trailing)
                

                
//                login button
                
                Button{
                    Task{ try await viewModel.login()}
                } label: {
                    Text("Login")
                        .font (. subheadline)
                    .fontWeight (.semibold)
                    .foregroundColor ( .white)
                    .frame(width: 360, height: 44)
                    .background (Color (. systemBlue))
                    .cornerRadius (10)
                }
                .padding(.vertical)
                
                
                
                
                HStack {
                Rectangle()
                .frame (width: (UIScreen.main.bounds .width / 2) - 40, height: 0.5)
                    
                Text ("OR")
                .font (. footnote)
                .fontWeight(.semibold)
                    
                Rectangle ()
                .frame(width: (UIScreen.main.bounds.width / 2)
                - 40, height: 0.5)
}
                .foregroundColor (.gray)
                
                HStack{
                    Text( "Continue with Facebook" )
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor (Color (.systemBlue))
                } .padding(.top,8)

//                     signup

                    Divider()
                    .padding(.top, 20)
                    NavigationLink{
                      
RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                        Text ("Don't have an account?")
                        Text ("Sign Up")
                                .fontWeight(.semibold)
                              }
                        .font (.footnote)
                    }
                    .padding (.vertical)
                    .padding(.top, 200)
                }
            }
            
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
