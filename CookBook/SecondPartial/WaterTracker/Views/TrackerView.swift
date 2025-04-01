//
//  TrackerView.swift
//  mobileSwiftUI
//
//  Created by ITIT on 26/03/25.
//

import SwiftUI

struct TrackerView: View {
    
    @StateObject private var viewModel = WaterTrackerViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                Image("255ml")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(7)
                    .padding(5)
                    .background(Color.clear)
                    .cornerRadius(10)
                
                Spacer()
                
                Text("255 ml of water")
                    .padding(15)
                    .font(.system(size: 15))
            }
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
            )
            .padding(20)
            .onTapGesture {
                viewModel.aumcuarter()
            }
            
            HStack{
                Image("500ml")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(7)
                    .padding(5)
                    .background(Color.clear)
                    .cornerRadius(10)
                
                Spacer()
                
                Text("255 ml of water")
                    .padding(15)
                    .font(.system(size: 15))
            }
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
            )
            .padding(20)
            .onTapGesture {
                viewModel.aummed()
            }
            
            HStack{
                Image("liter")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(7)
                    .padding(5)
                    .background(Color.clear)
                    .cornerRadius(10)
                
                Spacer()
                
                Text("255 ml of water")
                    .padding(15)
                    .font(.system(size: 15))
            }
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
            )
            .padding(20)
            .onTapGesture {
                viewModel.aumlit()
            }
            
            Text("\(viewModel.Total) ml of water")
                .font(.system(size: 35))
            
        }
        
        .onShake {
            viewModel.Total = 0
        }
    }
}

#Preview {
    TrackerView()
}

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
