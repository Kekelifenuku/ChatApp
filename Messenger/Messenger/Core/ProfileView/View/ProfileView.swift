//
//  ProfileView.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/5/23.
//

import SwiftUI
import PhotosUI
import Firebase
struct ProfileView: View {
    //    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var viewModel = ProfileViewModel()
    @Environment (\.dismiss) var dismiss
    let user: User
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                PhotosPicker(selection: $viewModel.selecteditem){
                    if let profileImage = viewModel.profileimage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(200)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.red, lineWidth: 4))
                            .padding(.trailing)
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                
                Text(user.fullname  )
                    .font(.headline)
                    .padding(.top, 10)
                    .font(.headline)
                    .padding(.trailing, 10)
                
            }
            
            List{
                
                
                
                //                         darkmode
                
                //                        Toggle("Dark Mode", isOn: $isDarkMode)
                //                            .toggleStyle(SwitchToggleStyle(tint: .red))
                
                
                
                
                HStack{
                    
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "door.right.hand.open")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red)
                            .clipShape(Circle())
                    }
                    Text("Logout")
                    
                        .font(.headline)
                        .padding(.leading, 20)
                }
                
                
                
                
                
                HStack{
                    Button{
                    } label: {
                        
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red)
                            .clipShape(Circle())
                    }
                    Text("Delete Account")
                    
                        .font(.headline)
                        .padding(.leading, 20)
                }
            }
        }
    }
    
    
}
//            .toolbar{
//        ToolbarItem(placement: .navigationBarLeading) {
//            Button ( "Cancel"){
//                dismiss()
//            }
//            .foregroundColor(.black)
//        }
//}
                
       
        

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER)
    }
}
