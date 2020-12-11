//
//  TimerView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var instance: PainViewModel
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
            
            NavigationLink(destination: PainView(), isActive: $instance.fullSend) {}
            NavigationLink(destination: DoneView(), isActive: $instance.success) {}
            
            VStack {
                Text("you're almost there!")
                    .font(.system(size:24))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.top, 55)
                Spacer()
                AnimatedImageView(fileName: "fire")
                    .frame(width: 400, height: 300)
                Text(convertTime(seconds: instance.secondsLeft))
                    .font(.system(size:48))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Button(action:{
                    instance.giveUp()
                }) {
                    Text("full send, i give up")
                        .font(.system(size:24))
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: 200)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.06150070578, green: 0.4991858006, blue: 0.5260352492, alpha: 1)))
                        .cornerRadius(50)
                }.padding(.bottom, 75)
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                instance.exitTimer()
                }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func convertTime(seconds: Int) -> String {
        let hours = "\(seconds / 3600)"
        let minutes = "\((seconds % 3600) / 60)"
        let seconds = "\((seconds % 3600) % 60)"
        let hourStamp = hours.count > 1 ? hours : "0" + hours
        let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
        let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
        
        return "\(hourStamp) : \(minuteStamp) : \(secondStamp)"
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
