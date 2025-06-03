import SwiftUI

struct QRScannerView: View {
    @State private var scannedCode: String = ""
    @State private var showScanner = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Código escaneado:")
                .font(.headline)
            Text(scannedCode.isEmpty ? "Aún no escaneado" : scannedCode)
                .padding()
                .multilineTextAlignment(.center)

            Button("Escanear código QR") {
                showScanner = true
                scannedCode = ""
            }
            .padding()
            .sheet(isPresented: $showScanner) {
                QRScanViewModel(scannedCode: $scannedCode)
            }
        }
        .padding()
    }
}
