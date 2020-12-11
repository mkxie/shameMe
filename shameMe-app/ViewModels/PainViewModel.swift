//
//  PainViewModel.swift
//  shameMe-app
//
//  Created by Matthew Xie on 12/7/20.
//

import Foundation
import ContactsUI
import Alamofire

class PainViewModel : ObservableObject {
    
    @Published var contact: CNContact?
    @Published var message: String = ""
    @Published var fullSend: Bool = false
    @Published var success: Bool = false
    @Published var secondsLeft : Int = 0
    
    private var timeLeft: Time?
    private var timerOn: Bool = false
    var timer = Timer()
    
    init() {
        restart()
    }
    
    func restart() {
        contact = nil
    }
    
    func yolo(timeLeft: Time, contact: CNContact, message: String) {
        self.timeLeft = timeLeft
        self.contact = contact
        self.message = message
        self.secondsLeft = (timeLeft.hour * 3600) + (timeLeft.minute * 60)
        self.success = false
        self.fullSend = false
    }
    
    func startTimer() {
        self.timerOn = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft <= 1 {
                self.timeOut()
            }
            self.secondsLeft -= 1
        })
    }
    
    private func launch() {
        // send the message
        if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
           let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
    
            let twilioNumber = "+12693388130"
            let contactNumber = (self.contact!.phoneNumbers[0].value).value(forKey: "digits") as! String
            let fullMessage = "You have a new message from " + UIDevice.current.name + ": " + message
            
            let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
            let parameters = ["From": twilioNumber, "To": contactNumber, "Body": fullMessage]

            AF.request(url, method: .post, parameters: parameters)
                .authenticate(username: accountSID, password: authToken)
                .responseJSON { response in
                    debugPrint(response)
            }

        }
    }
    
    func exitTimer() {
        if self.timerOn {
            self.timerOn = false
            launch()
            self.fullSend = true
            timer.invalidate()
        }
    }
    
    func giveUp() {
        self.timerOn = false
        launch()
        self.fullSend = true
        timer.invalidate()
    }
    
    func timeOut() {
        self.timerOn = false
        self.success = true
        timer.invalidate()
    }
        
}
