//
//  M7SMSField.swift
//  
//
//  Created by Alexandr Romanov on 15.10.2020.
//

import SwiftUI
import Combine

public struct M7SMSField: View {
    
     @Binding public var code: String
    let textLimit = 6
    
    public init(_ code: Binding<String> = .constant("")) {
        self._code = code
    }
    
    public var body: some View {
        TextField("123 456", text: $code)
            .onReceive(Just(code)) { _ in limitText(textLimit) }
            
            
                                        .textContentType(.oneTimeCode)
                                        .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
        

            
        
    }
    
    func limitText(_ upper: Int) {
            if code.count > upper {
                code = String(code.prefix(upper))
            }
        }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        M7SMSField()
//    }
//}
