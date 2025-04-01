//
//  ConversorView.swift
//  mobileSwiftUI
//
//  Created by ITIT on 17/02/25.
//

import SwiftUI

struct ConversorView: View {
    @StateObject private var viewModel = ConverterViewModel()
    
    var body: some View {
        
        VStack{
            Text ("Temperture Converter")
            
            TextField("Enter Celcius Temperature", text: $viewModel.number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal, 50)
                .padding(.top, 25)
            
            Button("Calculate"){
                viewModel.convertir()
            }
            .padding(.top, 25)
            
            Image(viewModel.temperatureimg)
            
            
            Text("El Resultado es \(String(format: "%1.f", viewModel.result ?? 0))")
        }
        Spacer()
                
    }
}

#Preview {
    ConversorView()
}
