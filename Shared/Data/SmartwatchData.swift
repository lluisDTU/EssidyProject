//
//  SmartwatchData.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 20/4/22.
//

import Foundation

struct Team: Identifiable {
    var Date: String = ""
    var Temperature: String = ""
    var HR: String = ""
    var VO2: String = ""
    var id = UUID()
    
    init(raw: [String]){
        Date = raw[0]
        Temperature = raw[1]
        HR = raw[2]
        VO2 = raw[3]
    }
}

func loadCSV(from csvName: String) -> [Team] {
    var csvToStruct = [Team]()
    
    // locate the csv file
    guard let filePath =  Bundle.main.path(forResource: csvName, ofType: "csv") else{
        return []
    }
    
    // convert the contents of the file into one very long string
    var data=""
    do {
        data = try String(contentsOfFile: filePath)
    } catch{
        print(error)
        return []
    }
    
    // split the long string into an array of rows of the data. Each row is a string
    // detect "\n" carriage return, then split
    var rows = data.components(separatedBy:"\n")
    
    // remove header rows
    // count the number of header columns before removing
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    // now loop around each row and split into columns
    for row in rows{
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount{
            let teamStruct = Team.init(raw: csvColumns)
            csvToStruct.append(teamStruct)
        }
    }
    
    return csvToStruct
}
