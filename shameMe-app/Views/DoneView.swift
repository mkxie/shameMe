//
//  DoneView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct DoneView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("congrats")
                                .font(.system(size:48))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                                .padding(.top, 50)
                                .padding(.leading, 30)
                            Spacer()
                        }
                        
                        HStack {
                            Text("you avoided quite the embarassment... this time")
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                            Spacer()
                        }
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        ZStack{
                            Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
                            NavigationLink(destination: SetupView()) {
                                Text("try again")
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
                    }.padding(.top, 200)
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .top)
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
    }
}
