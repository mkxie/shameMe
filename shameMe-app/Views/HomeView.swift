//
//  HomeView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var instance: PainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1))]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    Text("shameMe")
                        .font(.system(size:48))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                        .padding(.top, 100)
                    Text("be productive... or else")
                        .font(.system(size:24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                        .padding(.top, 30)
                    Image("paperplane")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    NavigationLink(destination: SetupView()) {
                        Text("start")
                            .font(.system(size:24))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: 225)
                                .padding()
                                .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.06150070578, green: 0.4991858006, blue: 0.5260352492, alpha: 1)))
                            .cornerRadius(50)
                    }.padding(.top, 100)
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
