//
//  WaterTrackerView.swift
//  mobileSwiftUI
//
//  Created by ITIT on 24/03/25.
//

import SwiftUI

struct WaterTrackerView: View {
    @StateObject private var viewModel = WaterTrackerViewModel()
    
    @State var name: String = ""
    @State var age: String = ""
    @State var weight: String = ""
    
    @AppStorage("Name") private var Name: String = ""
    @AppStorage("Age") private var Age: String = ""
    @AppStorage("Weight") private var Weight: String = ""
    
    var body: some View {
        VStack {
            Text ("Water Tracker")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 30)
            
            Text ("Name:")
            
            TextField ("Name:", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal, 50)
                .padding(.bottom, 5)
            
            Text("Age:")
            TextField ("Age:", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal, 50)
                .padding(.bottom, 5)
            
            Text ("Weight:")
            TextField ("Weight:", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal, 50)
                .padding(.bottom, 5)
            
            Button("Join"){
                Name = name
                Age = age
                Weight = weight
            }
        }
        Spacer()
        
            .onAppear{
                name = Name
                age = Age
                weight = Weight
            }
    }
}

#Preview {
    WaterTrackerView()
}
