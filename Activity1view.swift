//
//  View.swift
//  ActivityScreen
//
//  Created by Zahrah. on 31/10/2022.
//

import SwiftUI
struct AppView: View {
    
var row: [GridItem]
var cardHeight: CGFloat
var location = ["mdin3", "mdin11", "mdin4","mdin2"]

@State private var showModal = false
@State private var selected = ""

var body: some View {
    ZStack {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: row, spacing: 10){
                ForEach(location, id: \.self) {loc in
                    Button(action: {
                        self.showModal = true
                        self.selected = loc
                    }){
                        VStack(alignment: .leading, spacing: 15){
                            Spacer()
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .frame(width: 165, height: self.cardHeight)
                        .background(Image(loc).resizable().scaledToFill())
                           
                            
                        
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
                    }
                    }
                    
                }
            }
        }
    }
}




import SwiftUI
struct AppView3: View {
    
var row: [GridItem]
var cardHeight: CGFloat
var location = ["TayebIsm1", "TayebIsm2","Tayeb3"]

@State private var showModal3 = false
@State private var selected3 = ""

var body: some View {
    ZStack {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: row, spacing: 10){
                ForEach(location, id: \.self) {loc in
                    Button(action: {
                        self.showModal3 = true
                        self.selected3 = loc
                    }){
                        VStack(alignment: .leading, spacing: 15){
                            Spacer()
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .frame(width: 165, height: self.cardHeight)
                        .background(Image(loc).resizable().scaledToFill())
                           
                            
                        
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
                    }
                    }
                    
                }
            }
        }
    }
}

