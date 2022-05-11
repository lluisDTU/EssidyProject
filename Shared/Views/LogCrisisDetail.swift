//
//  LogCrisisDetail.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 29/4/22.
//

import SwiftUI

struct LogCrisisDetail: View {
    
    @ObservedObject var model = ViewModel()
    @State private var showAlert = false

    
    var body: some View {
        
        VStack{
            Text("Log Crisis History")
                .font(.title3)
                .fontWeight(.bold)
            
            List(model.list) {item in
                //
                HStack{
                    Text("Pain Crisis Details").font(.headline)
                        .foregroundColor(.blue)
                    Spacer()
                    Button("Delete") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Are you sure you want to delete this data?"),
                                message: Text("This action can not be reverted"),
                                primaryButton: .default(
                                    Text("No, cancel")
                                ),
                                secondaryButton: .destructive(
                                    Text("Yes, delete it"),
                                    action:{
                                        model.deleteData(todoToDelete:  item)
                                    }
                                )
                            )
                        }
                        
                           
                }
                
                HStack{
                    Text("Started:")
                        .fontWeight(.thin)
                    Text(item.start_pain)
                }
                HStack{
                    Text("Ended:")
                        .fontWeight(.thin)
                    Text(item.end_pain)
                }
                HStack{
                    Text("Where:")
                        .fontWeight(.thin)
                    Text(item.pain_location)
                }
                HStack{
                    Text("Pain Intensity: ")
                        .fontWeight(.thin)
                    Text(String(item.pain_intensity))
                }
                // Potential Triggers
                HStack{
                    Text("Potential Triggers: ")
                        .fontWeight(.thin)
                    if (item.heat_cold){
                        Text("Heat/cold")
                    }
                    if (item.wind){
                        Text("Wind")
                    }
                    if (item.altitude){
                        Text("Altitude")
                    }
                    if (item.stress){
                        Text("Stress")
                    }
                    if (item.exercise){
                        Text("Exercise")
                    }
                    if (item.dehydration){
                        Text("Dehydration")
                    }
                    if (item.infection){
                        Text("Infection")
                    }
                }
                // Relieved pain
                HStack{
                    Text("Pain Relieved by:")
                        .fontWeight(.thin)
                    if (item.medicine) {
                        Text("Medicine")
                    }
                    if (item.hospital){
                        Text("A Hospital")
                    }
                    if (item.heat){
                        Text("Heat")
                    }
                    if (item.relaxing){
                        Text("Relaxing")
                    }
                }
                // Other Symptoms
                Text("")
            }
        }
        }
    init() {
        model.getData()
    }
}

struct LogCrisisDetail_Previews: PreviewProvider {
    static var previews: some View {
        LogCrisisDetail()
            .environmentObject(ViewModel())
    }
}
