//
//  M7SelectModal.swift
//
//
//  Created by 18391981 on 16.06.2020.
//
import SwiftUI
import Combine

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
            .cornerRadius(M7Radius.m)
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


