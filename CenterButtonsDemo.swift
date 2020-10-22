//
//  CenterButtonsDemo.swift
//  Template Views
//
//  Created by Stevhen on 20/10/20.
//

import SwiftUI

struct CenterButtonsDemo: View {
    
    var body: some View {
        
        HStack {
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Direction")
                    .frame(width: 150, height: 50, alignment: .center)
            })
            
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Call")
                    .frame(width: 150, height: 50, alignment: .center)
            })
            
            
            Spacer()
            
        }
        .border(Color.black, width: 2)
        
    }
}

struct CenterButtonsDemo_Previews: PreviewProvider {
    static var previews: some View {
        CenterButtonsDemo()
    }
}
