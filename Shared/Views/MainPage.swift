//
//  MainPage.swift
//  Essidy
//
//  Created by Lluís Colomer Coll on 20/4/22.
//

import Foundation
import SwiftUI

struct MainPage: View {
    
    @State var ClearNotifications = false
    
    var body: some View {
        if (ClearNotifications==false) {
            NavigationView{
            VStack{
            ScrollView {
            VStack{
                Image("Welcome")
                HStack{
                    Spacer()
                        .frame(width: 30.0)
                    Text("Latest Notifications")
                    Spacer()
                    Button("Clear"){
                        ClearNotifications = true
                    }.foregroundColor(Color.blue)
                    Spacer()
                        .frame(width: 30.0)
                }
                Image("Weather warning notification")
                    .padding(.all, -20.0)
                Image("Pill reminder")
                    .padding(.all, -20.0)
                Image("Slow down")
                    .padding(.all, -20.0)
                VStack{
                    Spacer()
                HStack{
                    Spacer()
                        .frame(width: 30.0)
                Text("Make a new log")
                    .multilineTextAlignment(.leading)
                    .frame(height: 2.0)
                    Spacer()
                }
                ScrollView(.horizontal){
                HStack{
                    NavigationLink {
                        PainCrisis2()
                    } label: {
                        Image("Pain crisis")
                    }
                    NavigationLink {
                        LogCrisisDetail()
                    } label: {
                        Image("Log_history")
                    }.padding(.all, -45.0)
                    
                    NavigationLink {
                        ChooseChart()
                    } label: {
                        Image("Tracked_data")
                    }
                }
                }
                    Spacer()
                        .frame(height: 1.0)
            }
            }
        }
            .ignoresSafeArea()
                HStack{
                    Image("Home_icon").padding(.all, -20.0)
                    NavigationLink {
                        NotificationsTimeline()
                    } label: {
                        Image("Notifications_icon")
                    }
                    NavigationLink {
                        ChooseChart()
                    } label: {
                        Image("Tracked_icon")
                            .padding(.all, -20.0)
                    }
                    Image("Profile_icon")
                }
        }.ignoresSafeArea()
            }
        }
        // if user clicks clear notifications
        else{
            NavigationView{
            VStack{
            ScrollView {
            VStack{
                Image("Clear_notifications").padding()
                VStack{
                    Spacer()
                HStack{
                    Spacer()
                        .frame(width: 30.0)
                Text("Make a new log")
                        .padding()
                    .multilineTextAlignment(.leading)
                    .frame(height: 2.0)
                    Spacer()
                }
                ScrollView(.horizontal){
                HStack{
                    NavigationLink {
                        PainCrisis2()
                    } label: {
                        Image("Pain crisis")
                    }
                    NavigationLink {
                        LogCrisisDetail()
                    } label: {
                        Image("Log_history")
                    }.padding(.all, -45.0)
                    
                    NavigationLink {
                        ChooseChart()
                    } label: {
                        Image("Tracked_data")
                    }
                }
                }
                    Spacer()
                        .frame(height: 1.0)
            }
            }
        }
            .ignoresSafeArea()
                HStack{
                    Image("Home_icon").padding(.all, -20.0)
                    NavigationLink {
                        NotificationsTimeline()
                    } label: {
                        Image("Notifications_icon")
                    }
                    NavigationLink {
                        ChooseChart()
                    } label: {
                        Image("Tracked_icon")
                            .padding(.all, -20.0)
                    }
                    Image("Profile_icon")
                }
        }.ignoresSafeArea()
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
