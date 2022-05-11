//
//  ViewPainCrisisDataBasic.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 27/4/22.
//

import Foundation
import Firebase


class ViewModel: ObservableObject{
    
    @Published var list = [PainCrisisData]()
    
    
    
    func deleteData(todoToDelete: PainCrisisData){
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to delete
        db.collection("Health Data Basic").document(todoToDelete.id).delete { error in
            
            // Check for errors
            if error == nil{
                // No errors
                
                // Update the UI from teh main thread
                DispatchQueue.main.async {
                    // Remove the todo that was just deleted
                    self.list.removeAll { todo in
                        // check for the todo to remove
                        return todo.id == todoToDelete.id
                    }
                }
            }
        }
        
    }

    
    func addData(start_pain: String, end_pain: String, pain_location: String, pain_intensity: Double,
                 heat_cold: Bool, wind: Bool, altitude: Bool, stress: Bool, exercise: Bool, dehydration: Bool,
                 infection: Bool,None: Bool, medicine: Bool, hospital: Bool, heat: Bool, relaxing: Bool, other_symptoms: String ){
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // add a document collection
        db.collection("Health Data Basic").addDocument(data: ["start_pain":start_pain, "end_pain":end_pain,
                                                              "pain_location":pain_location,"pain_intensity":pain_intensity,
                                                              "heat_cold":heat_cold,"wind":wind,"altitude":altitude,"stress":stress,
                                                              "exercise":exercise,"dehydration":dehydration,"infection":infection,
                                                              "None":None,"medicine":medicine,"hospital":hospital,"heat":heat,
                                                              "relaxing":relaxing,"other_symptoms":other_symptoms ]) { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Call get data to retrieve latest data
                self.getData()
            }
            else {
                // Handle the error
            }
        }
        
    }
    
    func getData(){
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("Health Data Basic").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                if let snapshot = snapshot{
                    
                    // Update the list propery in the main thread
                    DispatchQueue.main.async {
                    
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                    
                            // create a Todo item for each document returned
                            return PainCrisisData(id: d.documentID,
                                                  start_pain: d["start_pain"] as? String ?? "",
                                                  end_pain: d["end_pain"] as? String ?? "",
                                                  pain_location: d["pain_location"] as? String ?? "",
                                                  pain_intensity: d["pain_intensity"] as? Double ?? 0.0,
                                                  heat_cold: d["heat_cold"] as? Bool ?? false,
                                                  wind: d["wind"] as? Bool ?? false,
                                                  altitude: d["altitude"] as? Bool ?? false,
                                                  stress: d["stress"] as? Bool ?? false,
                                                  exercise: d["exercise"] as? Bool ?? false,
                                                  dehydration: d["dehydration"] as? Bool ?? false,
                                                  infection: d["infection"] as? Bool ?? false,
                                                  None: d["None"] as? Bool ?? false,
                                                  medicine: d["medicine"] as? Bool ?? false,
                                                  hospital: d["hospital"] as? Bool ?? false,
                                                  heat: d["heat"] as? Bool ?? false,
                                                  relaxing: d["relaxing"] as? Bool ?? false,
                                                  other_symptoms: d["other_symptoms"] as? String ?? "")
                    }
                }
            }
        }
        else {
                // Handle the error
        }
        
    }
    }
}
