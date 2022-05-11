//
//  ChooseChart.swift
//  Essidy App
//
//  Created by Lluís Colomer Coll on 2/5/22.
//

import SwiftUI

struct ChooseChart: View {
    
    @State private var Timeline = 2
    @State private var chartType = 1
    
    
    var body: some View {
        VStack{
            VStack{
                Image("Tracked_Data_Header")
                HStack{
                    Button {
                        Timeline  = 1
                    } label: {
                        if (Timeline==1){
                            Image("Timeline_button")
                        }
                        else{
                            Image("Timeline_button2")
                        }
                    }.padding(.horizontal, -4.0)

                    Button {
                        Timeline  = 2
                    } label: {
                        if (Timeline==1){
                            Image("Graphs_button")
                        }
                        else{
                            Image("Graphs_button2")
                        }
                    }.padding(.horizontal, -4.0)
                }
            }
            Spacer()
            if (Timeline==1){
                ScrollView{
                    Image("Notifications_timeline")
                    Image("Notifications_timeline2")
                }
            }
            if (Timeline==2){
                HStack{
                    Button("Temperature"){
                        chartType = 1
                    }
                    .padding()
                    .background(Color(red: 243/255, green: 244/255, blue: 249/255))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    Button("Heart Rate"){
                        chartType = 2
                    }
                    .padding()
                    .background(Color(red: 243/255, green: 244/255, blue: 249/255))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    Button("VO2 max"){
                        chartType = 3
                    }
                    .padding()
                    .background(Color(red: 243/255, green: 244/255, blue: 249/255))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                }
                
                if (chartType==1) {
                    TemperatureLineChartView()
                }
                if (chartType==2){
                    HRLineChart()
                }
                if (chartType==3) {
                    VO2LineChart()
                }
                Spacer()
            }

            Image("Footer V2")
                    .padding(.all, -20.0)
        }
        .ignoresSafeArea()
    }
}

struct ChooseChart_Previews: PreviewProvider {
    static var previews: some View {
        ChooseChart()
    }
}
