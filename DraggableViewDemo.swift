//
//  DraggableViewDemo.swift
//  Template Views
//
//  Created by Stevhen on 20/10/20.
//

import SwiftUI

struct DraggableViewDemo: View {
    
    @State var pos = CGPoint(x: 125, y: 125)
    
    @GestureState private var isDragging = false
    
    var body: some View {
        
        VStack {
            Image(systemName: "pencil.circle")
                .font(.title)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 238, height: 238)
                .position(pos)
                .scaleEffect(self.isDragging ? 0.5 : 1)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            
                            //limit drag only to bottom
                            if value.location.y >= self.pos.y {
                                
                                //limit drag to bottom no more than 335 pixels
                                if value.location.y <= 335 {
                                    self.pos.y = value.location.y
                                }
                                
                            }
                            
                        })
                        .onEnded { value in
                            
                            if value.location.y >= 335 {
                                //do something if collided with another view
                            }
                            
                            //return to original position if have not collided
                            self.pos.y = 125
                        }
                        .updating($isDragging, body: { (value, state, trans) in
                            
                            state = true
                        })
                )
        }
        .padding()
    }
}

struct DraggableViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        DraggableViewDemo()
    }
}
