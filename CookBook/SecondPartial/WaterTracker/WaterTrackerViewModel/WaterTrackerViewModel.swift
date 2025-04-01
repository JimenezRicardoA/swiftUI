
import Foundation

class WaterTrackerViewModel: ObservableObject{
    @Published var Total = 0
    
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

