//
//  ContentView.swift
//  ActivityScreen
//
//  Created by Zahrah. on 31/10/2022.
//

import SwiftUI
struct Activity1: View {
    @State var selected = -1
    @State var message = false
    var body: some View {
        
            ZStack(){  Color("background")
                ScrollView{
                    Image("mdin9").resizable()
                        .ignoresSafeArea()
                        .scaledToFill().frame(width:200 ,height: 400).position(x:250,y:190).shadow(radius: 10)  .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
                    VStack{
                        HStack{
                            Text("Madain Saleh is the most iconic historical site of the Kingdom of Saudi Arabia ,It is located in the north of Madinah Province, in the area of Al-Ula, join us now to explore the area more !").font(.body).fontWeight(.light).foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                                .padding(.top,3)
                            
                        }
                        
                        ZStack{Text("Madain Saleh").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white).shadow(radius: 3).position(x:125,y:-190)
                            Image(systemName: "mappin.and.ellipse").position(x:10,y:0)
                            Text("  Madina").font(.footnote).fontWeight(.light).position(x:47,y:3)
                            Image(systemName: "calendar").position(x:10,y:35)
                            Text("23/2/2023").font(.footnote).fontWeight(.light).position(x:58,y:35)
                            Image(systemName: "creditcard.fill").position(x:10,y:65)
                            Text("   1500 RS").font(.footnote).fontWeight(.light).position(x:46,y:65)
                           
                            HStack{Spacer()
                                RatingView(selected: $selected, message: $message)
                                   
                                    .padding(.horizontal,3)
                                    .padding([.top, .leading, .trailing],-178.0)
                                    .padding(.horizontal, 9.0)
                                
                            } .position(x: 130,y: 10)
                            .padding(.leading)
                            
                            .alert(isPresented: $message){
                                Alert(title: Text("Rating Submit"),message: Text("You Rated \(self.selected + 1) out of 5 Star Rating"),dismissButton: .none)}
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
                                
                                
                                AppView(row: i.gridItem, cardHeight: i.cardHeight)
                                Button("BOOK NOW           "){}
                                
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


struct Category: Identifiable {
    var id = UUID()
    var title: String
    var size: CGFloat
    var gridItem: [GridItem]
    var cardHeight: CGFloat
}
    
var category = [
    Category(title: "", size: 15, gridItem: Array(repeating: GridItem(.fixed(125), spacing: 10), count: 1), cardHeight: 90),
]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Activity1()
        Activity2()
    }
}
struct RatingView : View {
    @Binding var selected : Int
    @Binding var message : Bool
    var body: some View {
        ForEach(0..<5){
            rating in Image(systemName: "star.fill") .resizable() .frame(width: 15, height: 15)
                .foregroundColor(self.selected >= rating ? .yellow : .gray)
                .onTapGesture {
                    self.selected = rating
                    self.message.toggle()
                }
        }
    }
}
