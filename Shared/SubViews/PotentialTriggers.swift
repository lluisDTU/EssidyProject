//
//  PotentialTriggers.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI

struct PotentialTriggers: View {
    
    // Create variables for the Potential Triggers
    @State var heat_cold = false
    @State var wind = false
    @State var altitude = false
    @State var stress = false
    @State var exercise = false
    @State var dehydration = false
    @State var infection = false
    @State var None = false

    var body: some View {
        
        VStack{
            
            Text("Select potential triggers")
            
            HStack{
                // Heat-Cold
                Button(action:{
                    // Change Button type
                    heat_cold.toggle()
                }, label: {
                    if (heat_cold){
                        Image("Heat-cold-color")
                    } else{
                        Image("Heat-cold")
                    }
                }).padding()
                
                // Wind
                Button(action:{
                    // Change Button type
                    wind.toggle()
                    
                }, label: {
                    if (wind){
                        Image("Wind-color")
                    } else{
                        Image("Wind")
                    }
                })
                
                // Altitude
                Button(action:{
                    // Change Button type
                    altitude.toggle()
                }, label: {
                    if(altitude){
                        Image("Altitude-color")
                    } else{
                        Image("Altitude")
                    }
                }).padding()
                
                // Stress
                Button(action:{
                    // Transform Date to String
                    stress.toggle()
                }, label: {
                    if(stress){
                        Image("Stress-color")
                    } else{
                        Image("Stress")
                    }
                })
                Spacer()
            }
            
            
            HStack{
                
                // Exercise
                Button(action:{
                    // Change Button type
                    exercise.toggle()
                }, label: {
                    if (exercise){
                        Image("Exercise-color")
                    } else{
                        Image("Exercise")
                    }
                }).padding()
                
                // Dehydration
                Button(action:{
                    // Change Button type
                    dehydration.toggle()
                }, label: {
                    if (dehydration){
                        Image("Dehydration-color")
                    } else{
                        Image("Dehydration")
                    }
                })
                
                // Infection
                Button(action:{
                    // Change Button type
                    infection.toggle()
                }, label: {
                    if (infection){
                        Image("Infection-color")
                    } else {
                        Image("Infection")
                    }
                }).padding()
                
                // None
                Button(action:{
                    // Change Button type
                    None.toggle()
                }, label: {
                    if (None){
                        Image("None-color")
                    } else{
                        Image("None")
                    }
                })
                Spacer()
            }
        
    }
    }

}

struct PotentialTriggers_Previews: PreviewProvider {
    static var previews: some View {
        PotentialTriggers()
    }
}
