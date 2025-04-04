
import Foundation
import LocalAuthentication
import SwiftUI

class WaterTrackerViewModel: ObservableObject{
    @Published var Total = 0
    @State private var isUserAuthenticated = false
    @State private var showAlert = false
    
    func aumcuarter (){
        Total += 255
    }
    
    func aummed (){
        Total += 500
    }
    
    func aumlit () {
        Total += 1000
    }
    }

