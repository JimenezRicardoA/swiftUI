//
//  MainTracker.swift
//  mobileSwiftUI
//
//  Created by ITIT on 27/03/25.
//

import SwiftUI

struct MainTracker: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    
    
    @State private var navigateToWaterTracker = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("What do you want to do?")
                    .font(.system (size: 30))
                
                
                Button(action: {
                    viewModel.authenticateWithFaceID()
                }){
                    Text("Go to Water Tracker")
                        .padding(20)
                        .font(.system (size: 25))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 200)
                                .fill(Color.blue)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                NavigationLink(
                    destination: TrackerView(),
                    isActive: $navigateToWaterTracker,
                    label: { EmptyView() }
                )
                
                NavigationLink(destination: WaterTrackerView()){
                    Text("Go to Profile")
                        .padding(20)
                        .font(.system (size: 25))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 200)
                                .fill(Color.green)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }
            .onAppear {
                viewModel.isAuthenticated = false
            }
            .onChange(of: viewModel.isAuthenticated) { isAuthenticated in
                            if isAuthenticated {
                                navigateToWaterTracker = true
                            }
                        }
        }
    }
}

#Preview {
    MainTracker()
}
