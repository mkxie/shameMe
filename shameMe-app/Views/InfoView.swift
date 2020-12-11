//
//  InfoView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("how it works")
                            .font(.system(size:48))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .padding(.top, 50)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Welcome to the only productivity app that matters.\n\nSet your timer and draft a message to one of your contacts, the more embarassing the better.\n\nIf you exit or close the app before your timer runs out, your message will automatically send, no take backs.\n\nSalty Spitoon crew only. No Weenies allowed.")
                            .font(.system(size:24))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    
                }
                
                Spacer()

            }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .top)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
