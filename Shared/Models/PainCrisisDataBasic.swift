//
//  File.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import Foundation

struct PainCrisisData: Identifiable, Hashable {
    
    var id: String
    var start_pain: String
    var end_pain: String
    var pain_location: String
    var pain_intensity: Double
    
    // Potential Triggers Boolean variables
    var heat_cold: Bool
    var wind: Bool
    var altitude: Bool
    var stress: Bool
    var exercise: Bool
    var dehydration: Bool
    var infection: Bool
    var None: Bool
    
    // Pain Relieved Boolean variables
    var medicine: Bool
    var hospital: Bool
    var heat: Bool
    var relaxing: Bool
    
    // Other symptoms
    var other_symptoms: String
    
}
