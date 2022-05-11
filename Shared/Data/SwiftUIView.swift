//
//  SwiftUIView.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 20/4/22.
//

import SwiftUI

struct TeamView: View {
    var teams = loadCSV(from:"simulated_data_simple")
    
    
    
    
    var body: some View {
        List(teams) {team in
            Text(team.Date)
    }
}
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
