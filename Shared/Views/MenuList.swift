//
//  MenuList.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 20/4/22.
//

import Foundation
import SwiftUI

struct MenuList: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                PainCrisis2()
            } label: {
                Image("Pain crisis")
        }.navigationTitle("PainCrisisLog")

        }
    }
}


struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
