//
//  LogDetail.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 29/4/22.
//

import SwiftUI

struct LogDetail: View {
    
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {

        List(model.list) {item in
            
            Text(item.start_pain)
            Text(item.end_pain)
            Text(String(item.pain_intensity))
        }
    }
    init() {
        model.getData()
    }
}
struct LogDetail_Previews: PreviewProvider {
    static var previews: some View {
        LogDetail()
    }
}
