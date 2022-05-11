//
//  LineChartDemoView.swift
//  Essidy App
//
//  Created by Lluís Colomer Coll on 30/4/22.
//

import SwiftUI
import SwiftUICharts

struct TemperatureLineChartView: View {
    
    let data : LineChartData = weekOfData()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            LineChart(chartData: data)
                .pointMarkers(chartData: data)
                .touchOverlay(chartData: data, specifier: "%.0f")
                .yAxisPOI(chartData: data,
                          markerName: "Maximum Recommended",
                          markerValue: 25,
                          labelPosition: .none,
                          labelColour: Color.black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .yAxisPOI(chartData: data,
                          markerName: "Minimum Recommended",
                          markerValue: 10,
                          labelPosition: .none,
                          labelColour: Color.black,
                          labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                          lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .averageLine(chartData: data,
                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
                .infoBox(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
            
            Button("Tap to get more info") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Values keep being updated according to your pain crisis data"),
                        message: Text("Remember that maximum and minimum values are just orientative. However, keeping yourself inside the recommended range will significantlly increase the chances of avoiding a pain crisis to occur")
                    )
                }.padding()
                .font(.footnote)
            
        }
        .navigationTitle("")
        .padding()
    }
    

    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 13, xAxisLabel: "M", description: "Monday"),
            LineChartDataPoint(value: 10, xAxisLabel: "T", description: "Tuesday - PAIN CRISIS DETECTED"),
            LineChartDataPoint(value: 8,  xAxisLabel: "W", description: "Wednesday - PAIN CRISIS DETECTED"),
            LineChartDataPoint(value: 17, xAxisLabel: "T", description: "Thursday"),
            LineChartDataPoint(value: 21, xAxisLabel: "F", description: "Friday - PAIN CRISIS DETECTED"),
            LineChartDataPoint(value: 11, xAxisLabel: "S", description: "Saturday"),
            LineChartDataPoint(value: 9,  xAxisLabel: "S", description: "Sunday")
        ],
        legendTitle: "Temperature",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
        
        let metadata   = ChartMetadata(title: "Registered Temperature", subtitle: "Over last Week")
        
        let gridStyle  = GridStyle(numberOfLines: 7,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                        infoBoxBorderColour : Color.primary,
                                        infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 5),
                                        topLine             : .maximum(of: 30),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        return LineChartData(dataSets       : data,
                             metadata       : metadata,
                             chartStyle     : chartStyle)
        
    }
}

struct TemperatureLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureLineChartView()
    }
}
