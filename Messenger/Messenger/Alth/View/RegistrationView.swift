//
//  RegistrationView.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/5/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment (\.dismiss) var dismiss
    var body: some View {
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
                TextField("Enter your fullname", text: $viewModel.fullname)
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

            
//                SignUp button
            
            Button{
                Task{ try await viewModel.createUser()}
            } label: {
                Text("SignUp")
                    .font (. subheadline)
                .fontWeight (.semibold)
                .foregroundColor ( .white)
                .frame(width: 360, height: 44)
                .background (Color (. systemBlue))
                .cornerRadius (10)
            }
            .padding(.vertical)
            
            
            
            

            
            HStack{
                Text( "Continue with Facebook" )
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor (Color (.systemBlue))
            } .padding(.top,8)

//                     signup

               
              Button {
dismiss()
                } label: {
                    HStack(spacing: 3) {
                    Text ("Already have an account?")
                    Text ("Login")
                            .fontWeight(.semibold)
                          }
                    .font (.footnote)
                }
                .padding (.vertical)
                .padding(.top, 200)
            }
        }
    }

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
