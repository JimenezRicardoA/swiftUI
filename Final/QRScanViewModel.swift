import SwiftUI
import AVFoundation

struct QRScanViewModel: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    let session = AVCaptureSession()

    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        var parent: QRScanViewModel

        init(parent: QRScanViewModel) {
            self.parent = parent
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
               metadataObject.type == .qr,
               let code = metadataObject.stringValue {
                parent.scannedCode = code
                parent.session.stopRunning()
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return viewController }
        let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice)

        if session.canAddInput(videoInput!) {
            session.addInput(videoInput!)
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = UIScreen.main.bounds
        previewLayer.videoGravity = .resizeAspectFill
        viewController.view.layer.addSublayer(previewLayer)

        session.startRunning()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
