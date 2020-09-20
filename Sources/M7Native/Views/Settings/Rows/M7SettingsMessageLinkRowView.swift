//
//  File.swift
//  
//
//  Created by 18391981 on 17.09.2020.
//

//
//  M7SettingsTelegramLinkRowView.swift
//
//
//  Created by Alexander Romanov on 16.09.2020.
//

import SwiftUI
import MessageUI
import UIKit


public struct M7SettingsMessageLinkRowView: View {
    
    
    let adress: String
    let subject: String
    
    
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    
    
    public init(_ adress: String, subject: String) {
        self.adress = adress
        self.subject = subject
    }
    
    public var body: some View {
        HStack {
           
            Button(action: {
                // OPEN A LINK
                MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                
            }) {
                M7Row("Settings.FeedbakToAuthorTitle", leadingIcon: .mail, size: .s)
            }
            
            
        }
        //            .disabled(!MFMailComposeViewController.canSendMail())
        .sheet(isPresented: $isShowingMailView) {
            MailView(isShowing: self.$isShowingMailView, result: self.$result, adress: self.adress, subject: self.subject)
        }
        .alert(isPresented: self.$alertNoMail) {
            Alert(title: Text("NO MAIL SETUP"))
        }
        
    }
}

struct MailView: UIViewControllerRepresentable {
    
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    let adress: String
    let subject: String
    
//    init(_ adress: String, subject: String) {
//        self.sendAdress = adress
//        self.subject = subject
//    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
            let vc = MFMailComposeViewController()
            vc.setToRecipients([adress])
            vc.setSubject(subject)
            vc.mailComposeDelegate = context.coordinator
            return vc
        }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
    
    
}
