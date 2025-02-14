import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Image(systemName: "🥰")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Button") {
                print ("Hola")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
