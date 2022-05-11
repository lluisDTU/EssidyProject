//
//  PainCrisis2.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import SwiftUI
import Firebase

struct PainCrisis2: View {
    
    @State private var showingAlert = false
    
    @ObservedObject var model = ViewModel()
    
    @State var start_pain = ""
    @State var end_pain = ""
    @State var pain_location = ""
    @State var pain_text = false
    
    // variables Pain Intensity
    @State var pain_intensity = 0.0
    @State private var isEditing = false

    // variables Potential Triggers
    @State var heat_cold = false
    @State var wind = false
    @State var altitude = false
    @State var stress = false
    @State var exercise = false
    @State var dehydration = false
    @State var infection = false
    @State var None = false
    
    // variables pain relieved
    @State var medicine = false
    @State var hospital = false
    @State var heat = false
    @State var relaxing = false
    
    @State var other_symptoms = ""
    
    // Create Date variables for the Date Picker
    @State var Startdate = Date()
    @State var Enddate = Date()
    
    // Function to change Date to String
    func Date2String(date: Date)-> String {
        let dateFormatter = DateFormatter()
        // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }

    
    
    var body: some View {
        NavigationView{
        VStack{
        ScrollView {
            
            // Date Picker
            Group {
                Image("PainCrisis")
                    .padding(.bottom)
            
            Text("When did the crisis occur?").padding()
                
                VStack{
                    DatePicker(selection: $Startdate,
                               label: { Text("Start") }).padding(.horizontal, 40.0)
                    
                    Spacer()
                        .padding(.vertical, 1.0)
                        
                    DatePicker(selection: $Enddate, label: { Text("End") }).padding(.horizontal, 40.0)

                }
            Text(String(start_pain))
            }
            
            
            // Text("\(Int(PainIntensity))")
            
            // Pain Location
            Group{
                VStack{
                    Text("Where was the pain?")
                    Image("PainLocatorText")

                    
                    TextField("Write all the areas where you felt pain", text:$pain_location).padding(.horizontal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }
            }.padding()
            
            // Pain Intensity
            Group{
                VStack {
                    Text("How intense was the pain?")
                    ZStack{
                        
                        Image("Slice")

                        HStack{
                            Slider(
                                value: $pain_intensity,
                                in: 0...10,
                                step:1
                            ) {
                                Text("Speed")
                            } minimumValueLabel: {
                                Text("      ")
                            } maximumValueLabel: {
                                Text("      ")
                            } onEditingChanged: { editing in
                                isEditing = editing
                            }
                            .padding(.bottom, 20.0)
                        }.padding()
                    }

                    Text("Intensity: "+"\(Int(pain_intensity))")
                        .foregroundColor(isEditing ? .red : .blue)
                }
                
                
            }
            
            // Potential Triggers
            Group{
                
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
            }.padding()

            // Pain Relieved
            Group{
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

            
            Button("Log Pain Crisis"){
                // Show that the log has been done properly
                showingAlert = true
                
                // Transform Dates to Strings to be saved in the database
                start_pain = Date2String(date: Startdate)
                end_pain = Date2String(date: Enddate)
                
                // Call add data
                model.addData(start_pain: start_pain, end_pain: end_pain, pain_location: pain_location, pain_intensity: pain_intensity,
                    heat_cold:heat_cold, wind:wind, altitude :altitude,stress:stress,
                    exercise:exercise,dehydration:dehydration,infection:infection,
                    None:None,medicine:medicine,hospital:hospital,heat:heat,
                    relaxing:relaxing, other_symptoms: other_symptoms)
                
                // Reset all the fields
                start_pain = ""
                end_pain = ""
                pain_location = ""
                pain_text = false
                pain_intensity = 0.0
                isEditing = false
                heat_cold = false
                wind = false
                altitude = false
                stress = false
                exercise = false
                dehydration = false
                infection = false
                None = false
                medicine = false
                hospital = false
                heat = false
                relaxing = false
                other_symptoms = ""
                
                
            }
            .alert("Log saved", isPresented: $showingAlert){
                Button("Got it!",role: .cancel){}
                        
        }
            Image("Footer V2")
                    .padding(.all, -20.0)
        }.ignoresSafeArea()

    }
}
}
struct PainCrisis2_Previews: PreviewProvider {
    static var previews: some View {
        PainCrisis2()
    }
}
}
