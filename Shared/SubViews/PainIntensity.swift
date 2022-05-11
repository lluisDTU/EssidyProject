//
//  PainIntensity.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI

struct PainIntensity: View {
    
    @State var PainIntensity = 5.0
    @State private var isEditing = false
    
    
    var body: some View {
        
        VStack {
            Text("How intense was the pain?")
            ZStack{
                
                Image("Slice")

                HStack{
                    Slider(
                        value: $PainIntensity,
                        in: 0...10,
                        step:1
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("     ")
                    } maximumValueLabel: {
                        Text("    ")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    .padding(.bottom, 20.0)
                }.padding()
            }

            Text("Intensity: "+"\(Int(PainIntensity))")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

struct PainIntensity_Previews: PreviewProvider {
    static var previews: some View {
        PainIntensity()
    }
}
