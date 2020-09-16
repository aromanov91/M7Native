//
//  File.swift
//  
//
//  Created by 18391981 on 20.06.2020.
//

import SwiftUI

public enum M7RowButtonStyle {
    case row
    case link
    case delete
}

public struct M7RowButton: View {

    public var text: String
    public var style: M7RowButtonStyle
    public var leadingImage: M7IconNames
    public var tapAction: () -> Void
    
    public init(_ text: String,
                style: M7RowButtonStyle = .row,
                leadingImage: M7IconNames = .none,
                action: @escaping () -> Void
                ) {
        self.text = text
        self.style = style
        self.leadingImage = leadingImage
        self.tapAction = action
    }

    public var body: some View {
        VStack(alignment: .leading) {

            Button(action: self.tapAction ) {

                HStack() {

                    if leadingImage != .none {

                        M7Surface(background: .secondary, padding: .xxs) {

                            M7Icon(leadingImage, color: .onSurfaceHighEmphasis)

                        }
                    }

                    M7Text(text, style: .paragraph1).foregroundColor( style == .link ? M7Colors.link : style == .delete ? M7Colors.error : M7Colors.onSurface.highEmphasis)

                    Spacer()

                }
            }

        }.frame(minHeight: 70)

    }
}

struct M7RowButton_Previews: PreviewProvider {
    static var previews: some View {
        M7RowButton("Button") {
            print(#function)
        }
    }
}
