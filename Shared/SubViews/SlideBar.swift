//
//  SlideBar.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI



struct SlideBar: View {
    
    @State private var speed = 5.0
    @State private var isEditing = false

    var body: some View {
        VStack {
            Text("How intense was the pain?")
            ZStack{
                Image("Slice")
                HStack{
                    Slider(
                        value: $speed,
                        in: 0...10,
                        step:1
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("10")
                    } onEditingChanged: { editing in
                        isEditing = editing
                        }
                }.padding()
            }

            Text("\(Int(speed))")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

struct SlideBar_Previews: PreviewProvider {
    static var previews: some View {
        SlideBar()
    }
}
