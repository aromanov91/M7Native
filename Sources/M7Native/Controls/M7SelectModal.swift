//
//  M7SelectModal.swift
//
//
//  Created by 18391981 on 16.06.2020.
//
import SwiftUI
import Combine





public struct Toast<Presenting>: View where Presenting: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding public var isShowing: Bool
    /// The view that will be "presenting" this toast
    public let presenting: () -> Presenting
    /// The text to show
    public let text: Text

    public var body: some View {

        GeometryReader { geometry in
            
            ZStack {

            ZStack(alignment: .center) {

                self.presenting()
                    .blur(radius: self.isShowing ? 1 : 0)
                    
                    
                    

                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)

            }
                
            }.background(Color.red)


        }

    }

}

extension View {

    public func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }

}






public struct M7SelectModal: View {
    
    
    @Binding public var  selected: String
    @State var showModal = false
    public var selectionRows: [String]
    
    public init(_ selectionRows: [String] = [""], selected: Binding<String> = .constant("")) {
        self.selectionRows = selectionRows
        self._selected = selected
    }
    
    public var body: some View {
        
        ZStack {
            
            Button(action: {
                self.showModal.toggle()
               
            }) {
                M7Text(self.selected)
                Spacer()
                Image("chevron-down")
                    
            }.frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .frame(height: 52)
            .background(M7Colors.surface.secondary)
            .cornerRadius(M7Radius.medium)
            .foregroundColor(M7Colors.onSurface.highEmphasis)

            .sheet(isPresented: $showModal) {
                ModalSelect(data: self.selectionRows, selected: self.$selected, showModal: self.$showModal)
            }
            
        }
    }
    
}


public struct ModalSelect: View {
    
    public var data: [String]
    @Binding var selected : String
    @Binding var showModal : Bool
    
    //    init(_ rows: [String]) {
    //        self.data = rows
    //    }
    
    public var body: some View {
        
        NavigationView{
            
            M7List {
                ForEach(data,id: \.self) { i in
                    
                    M7RowButton(i, style: .row) {
                        self.selected = i
                        self.showModal.toggle()
                    }
            
                }
            }.navigationBarTitle("Select")
        }
    }
}


