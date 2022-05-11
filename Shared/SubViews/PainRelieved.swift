//
//  PainRelieved.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI

struct PainRelieved: View {
    
    @State var medicine = false
    @State var hospital = false
    @State var heat = false
    @State var relaxing = false

    var body: some View {
        VStack{
            Text("What relieved the pain?")
    
            HStack{
                
                // Medicine
                Button(action:{
                    medicine.toggle()
                }, label: {
                    if (medicine){
                        Image("Medicine-color")
                    } else{
                        Image("Medicine")
                    }
                }).padding()
                
                // Hospital
                Button(action:{
                    hospital.toggle()
                }, label: {
                    if (hospital){
                        Image("Hospital-color")
                    } else {
                        Image("Hospital")
                    }
                })
                
                // Heat
                Button(action:{
                    heat.toggle()
                }, label: {
                    if (heat) {
                        Image("Heat-color")
                    } else {
                        Image("Heat")
                    }
                }).padding()
                
                // Relaxing
                Button(action:{
                    relaxing.toggle()
                }, label: {
                    if (relaxing){
                        Image("Relaxing-color")
                    } else{
                        Image("Relaxing")
                    }
                })
                Spacer()
            }

            
            
        }
    }
}

struct PainRelieved_Previews: PreviewProvider {
    static var previews: some View {
        PainRelieved()
    }
}
