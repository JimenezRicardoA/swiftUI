import Foundation

class ConverterViewModel: ObservableObject{
    @Published var number: String = ""
    @Published var result: Double?
    @Published var imagen: String = ""
    
    func convertir() {
        let num = Double(number) ?? 0
        result = Double(((num * 9) / 5) + 32.0)
    }
    
    var temperatureimg: String{
        if let img = result {
            if img < 50 {
                return "snowman"
            } else if img <= 85{
                return "beach"
            }else {
                return "sun"
            }
        }
        return "juego"
    }

    }

