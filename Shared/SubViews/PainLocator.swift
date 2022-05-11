//
//  PainLocator.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI

struct PainLocator: View {
    
    @State var pain = ""
    @State var paintext = false
    
    var body: some View {
        
        VStack{
            Text("Where was the pain?").padding()
            
            Button(action:{
                // Change Button type
                paintext.toggle()
                }, label: {
                    if (paintext){
                        Image("PainLocatorText")
                    } else{
                        Image("PainLocatorText")
                    }
                }).padding()
            
            TextField("Write all the areas where you felt pain", text:$pain).padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
            }
}

struct PainLocator_Previews: PreviewProvider {
    static var previews: some View {
        PainLocator()
    }
}
