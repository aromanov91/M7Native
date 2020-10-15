//
//  M7SMSField.swift
//  
//
//  Created by Alexandr Romanov on 15.10.2020.
//

import SwiftUI

public struct M7SMSField: View {
    
     @Binding public var code: String
    
    public init(_ code: Binding<String> = .constant("")) {
        self._code = code
    }
    
    public var body: some View {
        TextField("1234", text: $code)
                                        .textContentType(.oneTimeCode)
                                        .keyboardType(.numberPad)
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        M7SMSField()
//    }
//}
