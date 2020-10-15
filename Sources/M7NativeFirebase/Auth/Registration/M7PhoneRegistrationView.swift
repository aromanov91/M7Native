//
//  M7PhoneRegistrationView.swift
//
//
//  Created by 18391981 on 12.10.2020.
//

import SwiftUI
import M7Native
import Firebase
import FirebaseAuth

public struct M7PhoneRegistrationView: View {
    
    public init() {}
    
   // @ObservedObject var model = M7AuthModel()
    
    @EnvironmentObject var model: M7AuthModel
    
    public var body: some View {
        
        NavigationView {
            

            //M7ModalNavigationView(/*M7Localize.auth.createAccounTitle*/ "Номер телефона" ) {
                
                
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: M7Space.m) {
                        
                        
                        
                        M7PhoneFiled($model.phoneNumber)
                        
                    }
                    
                    Spacer()
                    
                    M7Button(style: .primary, action: {
//
//                       Auth.auth().settings?.isAppVerificationDisabledForTesting = true
//
//                        print("Нажата кнопка")
//
//                        let phNo = "+79034764479"
//                               PhoneAuthProvider.provider().verifyPhoneNumber(phNo, uiDelegate: nil) { (verificationID, error) in
//                                   if let error = error {
//                                print("Еррор")
//                                       print(error.localizedDescription)
//                                       return
//                                   }
//                                   // Sign in using the verificationID and the code sent to the user
//                                   // ...
//
//                                print("Ок сассесс")
//                               //    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
//                               }
                        
                        
//                        PhoneAuthProvider.provider().verifyPhoneNumber("+79034764479", uiDelegate: nil) { (verificationID, error) in
//                          if let error = error {
//                            print(error.localizedDescription)
//                            return
//                          }
//
//                          // Sign in using the verificationID and the code sent to the user
//                          // ...
//                        }
                        
                       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                       // print("Phone " + model.phoneNumber)
                        
                        model.sendAuthSMS()
                        
                        
                        
                    }) {
                        M7Text(M7Localize.button.next, style: .button, color: .onPrimaryHighEmphasis)
                    }
                    
                    NavigationLink(destination: M7PhoneSMSView().environmentObject(model), tag: 1, selection: $model.navigationLink) {
                                    EmptyView()
                                }
                                
                    
                }.padding(.all, M7Space.m)
                
            //}
        }
    }
    
}

struct M7PhoneRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        M7PhoneRegistrationView()
    }
}
