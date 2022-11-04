//
//  ContentView.swift
//  homepagepro
//
//  Created by nouf on 03/04/1444 AH.
//   .imageScale(.small)
// Image(systemName: "globe")
import SwiftUI

struct Homepage: View {
    
    var body: some View {
        
        NavigationView {
            
            
            ZStack{
                
                ZStack{
                    Color("Color")
                        .ignoresSafeArea()
                    
                    HStack{
                        Image(systemName: "person.fill")
                            .padding(.trailing, 200.0)
                            .imageScale(.large)
                        Image(systemName:
                                "magnifyingglass")
                        .padding(.trailing, 15.0)
                        
                        Image(systemName: "gearshape.fill")
                            .imageScale(.medium)
                    }
                    .padding(.bottom, 700.0)
                    
                    VStack{
                        Text("Welcome")
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 40.0)
                            .padding(.bottom,27)
                        
                        
                        
                        
                        ZStack{
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack{
                                    ForEach(AppConfig.bestImages, id: \.self){  inde in
                                        
                                        VStack{
                                            Image(inde)
                                            
                                                .resizable()
                                                .scaledToFill()
                                                .clipped()
                                                .frame(width:350.0, height: 250)
                                                .cornerRadius(20)
                                                .padding(.leading, 5.0)
                                            
                                        }}}}
                            
                            Text("best JOY you may have✨")
                                .font(.title2)
                                .fontWeight(.bold)
                        .foregroundColor(Color("Color 1"))
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 100.0)
                                .padding(.vertical, 3.0)
                                .padding(.bottom,290.0)
                            
                        }
                        
                        
                        
                        Text("Activites 🎯")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color 1"))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 225.0)
                        
                            .padding(.top, 27.0)
                            .padding(.bottom, 20.0)
                        
                        
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(AppConfig.allImages1, id: \.self){ ind in
                                    
                                    VStack{
                                        Image(ind)
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                            .frame(width: 220.0, height: 150.0)
                                            .cornerRadius(7)
                                            .padding(.leading, 0.5)
                                        
                                        Text(ind)
                                            .fontWeight(.bold)
                                            .foregroundColor(.brown)
                                        
                                    }
                                }
                            }
                            .padding(.leading, 6.0)
                            
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

