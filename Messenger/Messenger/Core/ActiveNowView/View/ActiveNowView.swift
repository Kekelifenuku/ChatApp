//
//  ActiveNowView.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/5/23.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32){
                ForEach(viewModel.users, id: \.self) { user in
                    NavigationLink(value: Route.ChatView(user)) {
                        VStack{
                            ZStack(alignment: .bottomTrailing){
                                CircularProfileImageView(user:  user, size: .medium)
                                
                                ZStack{
                                    Circle()
                                        .fill (.white)
                                        . frame (width: 18, height:
                                                    18)
                                    Circle()
                                        .fill (Color (. systemGreen))
                                        .frame (width: 12, height: 12)
                                }
                                .padding(.trailing, 20)
                            }
                            Text (user.firstName)
                                .font (.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                
                }
            }
            .padding()
        }
        .frame (height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
