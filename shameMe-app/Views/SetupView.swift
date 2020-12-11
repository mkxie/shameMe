//
//  SetupView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI
import ContactsUI

struct SetupView: View {
    
    @State var time : Time = Time(hour: 0, minute: 1)
    @State var showContactPicker = false
    @State var contact : CNContact?
    @State var message : String = ""
    @State var toTimer : Bool = false
    
    @EnvironmentObject var instance: PainViewModel
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6030444503, green: 0.7413238287, blue: 0.7372608781, alpha: 1)).ignoresSafeArea()
            
            NavigationLink(destination: TimerView(), isActive: $toTimer) {}
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("setup")
                            .font(.system(size:48))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .padding(.top, 50)
                            .padding(.leading, 30)
                        Spacer()
                    }
                }
                
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("timer")
                                .font(.system(size:28))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .center) {
                        DurationPickerView(time: $time)
                            .frame(height: 70)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("contact")
                                .font(.system(size:28))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .padding(.top, 60)
                            Spacer()
                        }
                    }.padding(.top, 20)
                    
                    VStack(alignment: .center) {
                        ZStack {
                            ContactPicker(
                                showPicker: $showContactPicker,
                                onSelectContact: {c in
                                    self.contact = c
                                }
                            )
                            VStack {
                                Button(action: {
                                    self.showContactPicker.toggle()
                                }) {
                                    if self.contact == nil {
                                        Text("select contact")
                                            .font(.system(size:20))
                                            .frame(minWidth: 0, maxWidth: 250)
                                            .padding()
                                            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                            .cornerRadius(50)
                                    } else {
                                        Text("\(self.contact?.givenName ?? "")")
                                            .font(.system(size:20))
                                            .frame(minWidth: 0, maxWidth: 250)
                                            .padding()
                                            .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                            .cornerRadius(50)
                                    }
                                }
                            }
                        }.frame(height: 40)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("message")
                                .font(.system(size:28))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .padding(.top, 60)
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .center) {
                        TextField("message", text: $message)
                            .font(.system(size:20))
                            .frame(minWidth: 0, maxWidth: 250)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)))
                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .cornerRadius(50)
                    }
                }
                
                
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        Button(action:{
                            if contact != nil {
                                instance.yolo(timeLeft: time, contact: contact!, message: message)
                                instance.startTimer()
                                self.toTimer.toggle()
                            }
                        }) {
                            Text("yolo")
                                .font(.system(size:24))
                                .fontWeight(.semibold)
                                .frame(minWidth: 0, maxWidth: 150)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(#colorLiteral(red: 0.06150070578, green: 0.4991858006, blue: 0.5260352492, alpha: 1)))
                                .cornerRadius(50)
                        }.padding(.bottom, 75)
                        
                        NavigationLink(destination: InfoView()) {
                            Image(systemName: "info.circle")
                                .font(.system(size:40))
                                .frame(width: 40, height: 40)
                                    .padding()
                                .foregroundColor(Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)))
                                .cornerRadius(50)
                        }.padding(.bottom, 75)
                    }
                }
                
            }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .top)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
