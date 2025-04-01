//
//  MainTracker.swift
//  mobileSwiftUI
//
//  Created by ITIT on 27/03/25.
//

import SwiftUI

struct MainTracker: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("What do you want to do?")
                    .font(.system (size: 30))
                
                
                NavigationLink(destination: WaterTrackerView()){
                    Text("Go to Profile")
                        .padding(20)
                        .font(.system (size: 25))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 200)
                                .fill(Color.blue)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                NavigationLink(destination: TrackerView()){
                    Text("Go to WaterTracker")
                        .padding(20)
                        .font(.system (size: 25))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 200)
                                .fill(Color.blue)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    MainTracker()
}
