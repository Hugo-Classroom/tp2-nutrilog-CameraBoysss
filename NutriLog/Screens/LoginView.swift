import SwiftUI
import LocalAuthentication
import Foundation

struct LoginView: View {
    
    @Binding var isAuthentificated: Bool
    
    var body: some View {
        if (isAuthentificated) {
            HomeView()
        } else {
            ZStack {
                (Color("loginBgColor")).ignoresSafeArea()
                VStack{
                    Image("nutrilog-logo")
                        .resizable()
                        .frame(width: 350, height: 350)
                    Button(action: authenticate) {
                        Label("Se connecter", systemImage: "faceid")
                    }
                    .foregroundColor(.white)
                    .accentColor(Color("mainColorTheme"))
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if (context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)) {
            let reason = "we need to unlock data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if let error {
                    print (error)
                    return
                }
                if success {
                    print("Authetificated")
                    isAuthentificated = success
                }
            }
        }
    }
}

