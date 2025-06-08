import SwiftUI

@main
struct DialoggyDemoApp: App {
    
    private lazy var dialogStyleConfig: DialogStyleConfig = {
        var config = DialogStyleConfig(
            primaryButtonStyle: DialogButtonStyle(
                backgroundColor: .blue,
                foregroundColor: .white,
                cornerRadius: 10,
                font: .headline,
                horizontalPadding: 16,
                verticalPadding: 10
            ),
            secondaryButtonStyle: DialogButtonStyle(
                backgroundColor: .gray.opacity(0.2),
                foregroundColor: .black,
                cornerRadius: 10,
                font: .headline,
                horizontalPadding: 16,
                verticalPadding: 10
            ),
            titleFont: .title2,
            titleForegroundColor: .primary,
            messageFont: .body,
            messageForegroundColor: .secondary,
            imageSize: CGSize(width: 64, height: 64)
        )
        return config
    }()
    
    var body: some Scene {
        WindowGroup {
            DialoggyDemoContentView()
                .dialogable(style: dialogStyleConfig)
        }
    }
}

struct DialoggyDemoContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Open Example Dialog Screen") {
                    DialogExampleScreen()
                }
            }
            .navigationTitle("Dialoggy Demo")
        }
    }
}

struct DialogExampleScreen: View {
    
    @State private var showDialog: DialogModel?
    
    var body: some View {
        VStack {
            Text("This is a placeholder for the dialog example screen.")
                .padding()
            Button("Show Example Dialog") {
                showDialog = DialogModel(
                    title: "Welcome!",
                    message: "This is an example dialog using Dialoggy.",
                    actions: [
                        DialogAction(title: "OK", style: .primary) {
                            showDialog = nil
                        }
                    ]
                )
            }
            .padding()
        }
        .navigationTitle("Dialog Example")
        .dialog($showDialog)
    }
}
