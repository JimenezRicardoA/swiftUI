import SwiftUI
import AVFoundation

struct QRScannerView: View {
    @StateObject private var scanner = QRScannerController()

    var body: some View {
        ZStack {
            // Cámara en segundo plano
            QRScanViewModel(controller: scanner)
                .ignoresSafeArea() // Para que cubra toda la pantalla


            VStack(spacing: 20) {
                ZStack {
                    Text("Escanea tu QR!")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.purple)

                Spacer()

                Text(scanner.scannedCode.isEmpty ? "Aún no escaneado" : scanner.scannedCode)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(8)

                Spacer()
                
                if scanner.scannedCode.isEmpty {
                    Button("Scann") {
                        scanner.startScanning()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                } else {
                    Button("Reescanear código QR") {
                        scanner.reset()
                    }
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
