//
//  M7RatingView.swift
//  Listixs (iOS)
//
//  Created by Alexander Romanov on 03.10.2020.
//

import SwiftUI
import UIKit
import MessageUI
import StoreKit

public struct M7RateView: View {
    
    private var title = M7Localize.rate.title
    
    private var subtitle = M7Localize.rate.subtitle
    
    public var image = Image("empty", bundle: .module)
    
    public let adress: String = "aromano07@gmail.com"
    public let subject: String = "Feedback"

    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    @Environment(\.presentationMode) private var presentationMode
    
     public init() { }
    
    public init(image: Image) {
        self.image = image
    }

    public var body: some View {
        
        VStack(spacing: .zero) {
            
            HStack(alignment: .bottom, spacing: .zero) {
                
                Spacer()
            
                Button(action: {
                    
                    self.presentationMode.wrappedValue.dismiss()

                }, label: {
                    Image("closeButton", bundle: .module)
                }).frame(width: 28, height: 28, alignment: .trailing)
                
                Spacer().frame(width: M7Space.small)
                
            }.frame(height: M7Space.xLarge + M7Space.xxSmall)
        
            VStack(spacing: .zero) {
            
            Spacer().frame(height: M7Space.large, alignment: .center)
            
            VStack(spacing: M7Space.medium) {
                
                M7Text(title, style: .title1, alignment: .center)
                
                
                image
                    .scaledToFill()
                    .frame(width: 268, height: 268)
                    .clipped()
                
            }
            
            Spacer()
            
            VStack(spacing: M7Space.xLarge) {
                
                
                M7Text(subtitle, style: .title3, color: M7Color.onBackgroundMediumEmphasis, alignment: .center)
                
                HStack(spacing: M7Space.medium) {
                    
                    M7Button(style: .secondary, size: .l, round: .full, width: .round, action: {
                        
                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        
                        
                    }) {
                        M7Icon(.thumbsDown)
                    }
                    
                    M7Button(style: .primary, size: .l, round: .full, width: .round, action: {
                        SKStoreReviewController.requestReview()
                    }) {
                        M7Icon(.thumbsUp, color: .onPrimaryHighEmphasis)
                    }
                    
                }
            }
            
            Spacer()
            
        }.frame(maxWidth: 320)
            
        }  .sheet(isPresented: $isShowingMailView) {
            M7MailView(isShowing: self.$isShowingMailView, result: self.$result, adress: self.adress, subject: self.subject)
        }
        .alert(isPresented: self.$alertNoMail) {
            Alert(title: Text("NO MAIL SETUP"))
        }
        
    }
}

struct M7RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            M7RateView()
                .environment(\.locale, .init(identifier: "en"))
            
            M7RateView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
                .environment(\.locale, .init(identifier: "ru"))
            
        }
        
        
    }
}
