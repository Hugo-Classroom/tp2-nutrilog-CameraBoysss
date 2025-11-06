import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var isAuthenticated: Bool = false
    var body: some View {
        ZStack {
            (Color("loginBgColor")).ignoresSafeArea()
            VStack{
                Image("nutrilog-logo")
                    .resizable()
                    .frame(width: 350, height: 350)
                
                Button() {
                    authenticate()
                } label: {
                    Image(systemName: "faceid")
                    Text("Se connecter")
                }
                .foregroundColor(.white)
                .accentColor(Color("mainColorTheme"))
                .buttonStyle(.borderedProminent)
                
            }
        }
        
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "we need to unlock data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if let error {
                    print(error)
                    return
                }
                
                if success {
                    print("Authetificated")
                }
                isAuthenticated = success
                
            }
        }
    }
}

#Preview {
    LoginView()
}
