//
//  PainView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct PainView: View {
    
    @EnvironmentObject var instance: PainViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("pain")
                                    .font(.system(size:48))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                                    .padding(.top, 50)
                                    .padding(.leading, 30)
                                Spacer()
                            }
                            
                            Text("you sent the message")
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                            
                            Text(instance.message)
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                .padding(.leading, 30)
                                .padding(.top, 20)
                            
                            Text("to")
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .padding(.top, 20)
                            
                            Text("\(instance.contact?.givenName ?? "")")
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                .padding(.leading, 30)
                                .padding(.top, 20)
                                
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        ZStack{
                            Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
                            NavigationLink(destination: SetupView()) {
                                Text("round two")
                                    .font(.system(size:24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: 225)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(#colorLiteral(red: 0.06150070578, green: 0.4991858006, blue: 0.5260352492, alpha: 1)))
                                    .cornerRadius(50)
                            }
                        }
                    }.padding(.top, 100)
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .top)
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
