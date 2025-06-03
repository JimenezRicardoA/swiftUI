import SwiftUI
import AVFoundation

struct QRScanViewModel: UIViewControllerRepresentable {
    @ObservedObject var controller: QRScannerController

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        controller.getPreviewLayer(for: vc.view)
        controller.start()
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No necesita actualizar nada por ahora
    }
}

class QRScannerController: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    @Published var scannedCode: String = ""

    let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?

    override init() {
        super.init()
        setupSession()
    }

    private func setupSession() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else { return }

        session.addInput(input)

        let output = AVCaptureMetadataOutput()
        if session.canAddOutput(output) {
            session.addOutput(output)
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            output.metadataObjectTypes = [.qr]
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
           object.type == .qr,
           let code = object.stringValue {
            scannedCode = code
            stop()
        }
    }

    func start() {
        if !session.isRunning {
            session.startRunning()
        }
    }

    func stop() {
        if session.isRunning {
            session.stopRunning()
        }
    }

    func reset() {
        scannedCode = ""
        start()
    }

    func getPreviewLayer(for view: UIView) {
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer?.frame = view.bounds
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
    }
}

