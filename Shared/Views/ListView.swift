//
//  ListView.swift
//  Essidy (iOS)
//
//  Created by Lluís Colomer Coll on 29/4/22.
//

import SwiftUI



struct RowItem: Identifiable {
    
    let id = UUID()
    var name: String
    var list: [RowItem]?
    // var list: model.list
    
    static let mockupItems: [RowItem] = {
        var item1 = RowItem(name: "Section 1", list: [RowItem(name: "Option 1"),
                                                         RowItem(name: "Option 2"),
                                                         RowItem(name: "Option 3"),
                                                         RowItem(name: "Option 4"),
                                                         RowItem(name: "Option 5")
        ])
        
        var item2 = RowItem(name: "Section 2", list: [RowItem(name: "Option 6"),
                                                         RowItem(name: "Option 7"),
                                                         RowItem(name: "Option 8"),
                                                         RowItem(name: "Option 9"),
                                                         RowItem(name: "Option 10")
        ])
        
        return [item1, item2]
    }()
}

struct ListSimpleCollapsableView: View {
    
    @ObservedObject var model = ViewModel()
    
    let items: [RowItem] = RowItem.mockupItems
    
    var body: some View {
        List(items, children: \.list) { children in
            Text(children.name)
        }
    }
    init() {
        model.getData()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListSimpleCollapsableView()
    }
}
