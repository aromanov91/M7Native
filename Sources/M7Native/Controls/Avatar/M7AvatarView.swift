//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Romanov on 24.09.2020.
//

import SwiftUI

public enum M7AvatarSize: Int, CaseIterable {
    case s
    case m
    case l
}

public struct M7AvatarView: View {
    
    private struct Constants {
        
        /// Size
        static var sizeS: CGFloat { return M7Space.m }
        static var sizeM: CGFloat { return M7Space.xl }
        static var sizeL: CGFloat { return M7Space.xxxl }
        static var avatarTextSpaceS: CGFloat { return .zero }
        static var avatarTextSpaceM: CGFloat { return 2 }
        static var avatarTextSpaceL: CGFloat { return 2 }
        static var backgroundColor: Gradient { return Gradient(colors: [.red, .yellow, .green, .blue, .purple]) }
        static var borderColor: Color { return M7Color.onPrimaryHighEmphasis.color }
        static var borderLineWidth: CGFloat { return 2 }
    }
    
    let firstName: String
    let lastName: String
    let size: M7AvatarSize
    let avatar: Image
    let stroke: Bool
    
    public init(firstName: String = "",
                lastName: String = "",
                size: M7AvatarSize = .m,
                avatar: Image = Image(""),
                stroke: Bool = false
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.size = size
        self.avatar = avatar
        self.stroke = stroke
    }
    
    public var body: some View {
        
        if avatar != Image("") {
            
            avatar
                .resizable()
                .frame(width: size == .s ? Constants.sizeS : size == .m ? Constants.sizeM : Constants.sizeL,
                       height: size == .s ? Constants.sizeS : size == .m ? Constants.sizeM : Constants.sizeL)
                .clipShape(Circle())
                .overlay(stroke ? Circle().stroke(Constants.borderColor, lineWidth: Constants.borderLineWidth) : nil )
            
            
            
        } else {
            
            ZStack {
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [M7Color.warning.color, M7Color.success.color]), startPoint: .topLeading, endPoint: .bottom))
                    .frame(width: size == .s ? Constants.sizeS : size == .m ? Constants.sizeM : Constants.sizeL,
                           height: size == .s ? Constants.sizeS : size == .m ? Constants.sizeM : Constants.sizeL)
                    .overlay(stroke ? Circle().stroke(Constants.borderColor, lineWidth: Constants.borderLineWidth) : nil )
                
                HStack(spacing: size == .s ? Constants.avatarTextSpaceS : size == .m ? Constants.avatarTextSpaceM : Constants.avatarTextSpaceL) {
                    
                    if firstName != "" {
                        
                        M7Text(String(firstName.dropLast(firstName.count - 1)),
                               style: size == .s ? .overline: size == .m ? .title3 : .largeTitle,
                               color: M7Color.onPrimaryHighEmphasis)
                        
                    }
                    
                    if lastName != "" {
                        M7Text(String(lastName.dropLast(lastName.count - 1)),
                               style: size == .s ? .overline: size == .m ? .title3 : .largeTitle,
                               color: M7Color.onPrimaryHighEmphasis)
                    }
                }
            }
        }
    }
}


struct M7AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            M7AvatarView(firstName: "Jhon", size: .s)
                .previewDisplayName("Only firsy name")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .s, stroke: true)
                .previewDisplayName("First name, last name and storke")
            
            
            M7AvatarView(size: .s, avatar: Image("empty", bundle: .module))
                .previewDisplayName("Only avatar")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .s, avatar: Image("empty", bundle: .module), stroke: true)
                .previewDisplayName("All data")
            
            
        }.previewLayout(.fixed(width: 24, height: 24))
        .background(M7Colors.surface.tertiary)
        
        Group {
            
            M7AvatarView(firstName: "Jhon", size: .m)
                .previewDisplayName("Only firsy name")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .m, stroke: true)
                .previewDisplayName("First name, last name and storke")
            
            
            M7AvatarView(size: .m, avatar: Image("empty", bundle: .module))
                .previewDisplayName("Only avatar")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .m, avatar: Image("empty", bundle: .module), stroke: true)
                .previewDisplayName("All data")
            
            
        }.previewLayout(.fixed(width: 48, height: 48))
        .background(M7Colors.surface.tertiary)
        
        
        Group {
            
            M7AvatarView(firstName: "Jhon", size: .l)
                .previewDisplayName("Only firsy name")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .l, stroke: true)
                .previewDisplayName("First name, last name and storke")
            
            
            M7AvatarView(size: .l, avatar: Image("empty", bundle: .module))
                .previewDisplayName("Only avatar")
            
            
            M7AvatarView(firstName: "Jhon", lastName: "Smith", size: .l, avatar: Image("empty", bundle: .module), stroke: true)
                .previewDisplayName("All data")
            
            
        }.previewLayout(.fixed(width: 96, height: 96))
        .background(M7Colors.surface.tertiary)
    }
}
