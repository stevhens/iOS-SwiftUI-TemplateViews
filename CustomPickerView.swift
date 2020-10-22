//
//  CustomPickerView.swift
//  Template Views
//
//  Created by Stevhen on 20/10/20.
//

import SwiftUI

struct CustomPickerView: View {
    
    @State var showPicker = false
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Color.grayBg
                    .ignoresSafeArea()
                    .zIndex(-3)
                
                VStack {
                    
                    HStack {
                        Text("PROFILE")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Favourite Frameworks")
                            .foregroundColor(.black)
                        Spacer()
                        
                        NavigationLink (
                            destination: CustomDetailPickerView(frameworks: frameworks, selectedIndex: $selectedFrameworkIndex),
                            isActive: $showPicker,
                            label: {
                                HStack {
                                    Text(frameworks[selectedFrameworkIndex])
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.gray)
                            })
                    }
                    .padding()
                    .background(Color.white)
                }
                
            }
            .zIndex(-4)
            
            .navigationBarTitle("Favorites")
        }
    }
}

struct CustomDetailPickerView: View {
    
    var frameworks: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack {
            Color.grayBg
                .ignoresSafeArea()
                .zIndex(-3)
            
            VStack {
                ForEach(0 ..< frameworks.count, id: \.self) { i in
                    Button(action: {
                        selectedIndex = i
                    }, label: {
                        HStack {
                            Text(frameworks[i])
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if i == selectedIndex {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                    })
                }
                .zIndex(-4)
            }
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView()
    }
}
