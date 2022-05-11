//
//  HRLineChart.swift
//  Essidy App
//
//  Created by Lluís Colomer Coll on 2/5/22.
//

import SwiftUI
import SwiftUICharts

struct HRLineChart: View {
    let data : LineChartData = weekOfData()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            LineChart(chartData: data)
                .pointMarkers(chartData: data)
                .touchOverlay(chartData: data, specifier: "%.0f")
                .yAxisPOI(chartData: data,
                          markerName: "Maximum Recommended",
                          markerValue: 105,
                          labelPosition: .none,
                          labelColour: Color.black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
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
                        message: Text("Remember that maximum value is just orientative. However, keeping yourself below the estimated value will reduce the chances of having a pain crisis")
                    )
                }.padding()
                .font(.footnote)
            
        }
        .navigationTitle("")
        .padding()
    }
    

    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 60, xAxisLabel: "0", description: "0 am"),
            LineChartDataPoint(value: 49, xAxisLabel: "", description: "1 am"),
            LineChartDataPoint(value: 47, xAxisLabel: "", description: "2 am"),
            LineChartDataPoint(value: 44, xAxisLabel: "", description: "3 am"),
            LineChartDataPoint(value: 45, xAxisLabel: "4", description: "4 am"),
            LineChartDataPoint(value: 44, xAxisLabel: "", description: "5 am"),
            LineChartDataPoint(value: 44, xAxisLabel: "", description: "6 am"),
            LineChartDataPoint(value: 62, xAxisLabel: "", description: "7 am"),
            LineChartDataPoint(value: 76, xAxisLabel: "8", description: "8 am"),
            LineChartDataPoint(value: 140, xAxisLabel: "", description: "9 am - PAIN CRISIS DETECTED"),
            LineChartDataPoint(value: 102, xAxisLabel: "", description: "10 am"),
            LineChartDataPoint(value: 90,  xAxisLabel: "", description: "11 am"),
            LineChartDataPoint(value: 77, xAxisLabel: "12", description: "12 am"),
            LineChartDataPoint(value: 75, xAxisLabel: "", description: "1 pm"),
            LineChartDataPoint(value: 70, xAxisLabel: "", description: "2 pm"),
            LineChartDataPoint(value: 68, xAxisLabel: "", description: "3 pm"),
            LineChartDataPoint(value: 84, xAxisLabel: "16", description: "4 pm"),
            LineChartDataPoint(value: 76, xAxisLabel: "", description: "5 pm"),
            LineChartDataPoint(value: 92, xAxisLabel: "", description: "6 pm"),
            LineChartDataPoint(value: 105,  xAxisLabel: "", description: "7 pm"),
            LineChartDataPoint(value: 80, xAxisLabel: "20", description: "8 pm"),
            LineChartDataPoint(value: 78, xAxisLabel: "", description: "9 pm"),
            LineChartDataPoint(value: 72, xAxisLabel: "", description: "10 pm"),
            LineChartDataPoint(value: 66,  xAxisLabel: "", description: "11 pm")
        ],
        legendTitle: "Heart Rate",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
        
        let metadata   = ChartMetadata(title: "Registered Heart Rate", subtitle: "Over last Day")
        
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
                                        
                                        baseline            : .minimumWithMaximum(of: 30),
                                        topLine             : .maximum(of: 150),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        return LineChartData(dataSets       : data,
                             metadata       : metadata,
                             chartStyle     : chartStyle)
        
    }
}

struct HRLineChart_Previews: PreviewProvider {
    static var previews: some View {
        HRLineChart()
    }
}
