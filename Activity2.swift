
//
//  screen2.swift
//  ActivityScreen
//
//  Created by Zahrah. on 03/11/2022.
//

import Foundation
import SwiftUI

struct Activity2: View {
    @State var selected1 = -1
    @State var message1 = false
    var body: some View {
        
            ZStack(){  Color("background")
                ScrollView{
                    Image("TAYEBISMM").resizable()
                        .ignoresSafeArea()
                        .scaledToFill().frame(width:300 ,height: 440).position(x:200,y:190).shadow(radius: 10).clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
                    VStack{
                        HStack{
                            Text("Tayyib al Ism is one of the magical natural wonders of Saudi Arabia that takes visitors by surprise, we could give you the oppertunity to trip with us and explore the area!").font(.body).fontWeight(.light).foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                                .padding(.top,-25)
                            
                        }
                        
                        ZStack{Text("Tayyib al Ism").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white).shadow(radius: 3).position(x:115,y:-190)
                            Image(systemName: "mappin.and.ellipse").position(x:10,y:0)
                            Text("            Tabuk-Mugna").font(.footnote).fontWeight(.light).position(x:47,y:3)
                            Image(systemName: "calendar").position(x:10,y:35)
                            Text("2/5/2023").font(.footnote).fontWeight(.light).position(x:55,y:35)
                            Image(systemName: "creditcard.fill").position(x:10,y:65)
                            Text("    1200 RS").font(.footnote).fontWeight(.light).position(x:46,y:65)
                           
                            HStack{Spacer()
                                RatingView(selected: $selected1, message: $message1)
                                   
                                    .padding(.horizontal,3)
                                    .padding([.top, .leading, .trailing],-178.0)
                                    .padding(.horizontal, 9.0)
                                
                            } .position(x: 130,y: 10)
                            .padding(.leading)
                            
                            .alert(isPresented: $message1){
                                Alert(title: Text("Rating Submit"),message: Text("You Rated \(self.selected1 + 1) out of 5 Star Rating"),dismissButton: .none)}
                        }.padding()
                        
                    }
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        
                        ForEach(category) { i in
                            VStack(spacing: 10){
                                HStack {
                                    Text(i.title)
                                        .font(.custom("Helvetica Neue", size: i.size))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                
                                
                                AppView3(row: i.gridItem, cardHeight: i.cardHeight)
                                Button("BOOK NOW           "){
                                    print("Button pressed!")
                                }
                                .padding()
                                .background(Color(hue: 0.029, saturation: 0.291, brightness: 0.864))
                                .foregroundColor(Color.white)
                                .clipShape(Capsule())
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 30)
                        }
                        Spacer()
                        
                    }
                    .padding(.horizontal,0.5)
                    .padding(.top,-12)
                    
                }
            }
            
        
        .ignoresSafeArea()}
}


struct Category2: Identifiable {
    var id = UUID()
    var title: String
    var size: CGFloat
    var gridItem: [GridItem]
    var cardHeight: CGFloat
}
    
var category2 = [
    Category(title: "", size: 15, gridItem: Array(repeating: GridItem(.fixed(125), spacing: 10), count: 1), cardHeight: 90),
]


struct Activity2_Previews2: PreviewProvider {
    static var previews: some View {
       // ContentView()
        Activity2()
    }
}
struct RatingView2 : View {
    @Binding var selected2 : Int
    @Binding var message2 : Bool
    var body: some View {
        ForEach(0..<5){
            rating in Image(systemName: "star.fill") .resizable() .frame(width: 15, height: 15)
                .foregroundColor(self.selected2 >= rating ? .yellow : .gray)
                .onTapGesture {
                    self.selected2 = rating
                    self.message2.toggle()
                }
        }
    }
}
