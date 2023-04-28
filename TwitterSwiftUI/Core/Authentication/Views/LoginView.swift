import SwiftUI
import FirebaseAnalyticsSwift

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack {
                AuthHeaderView(text: "Hello\nWelcome Back")
                fields
                forgotPassword
                signin
                Spacer()
                signup
            }
        }
        .analyticsScreen(name: "\(LoginView.self)")
    }
    
    var fields: some View {
        VStack(spacing: 40) {
            CustomInputField(image: "envelope", placeholder: "Email", text: $viewModel.email)
            CustomInputField(image: "lock", placeholder: "Password", text: $viewModel.password)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }
    var forgotPassword: some View {
        HStack {
            Spacer()
            NavigationLink {
                Text("Reset password ...")
            } label: {
                Text("Forgot Password?")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                    .padding(.top)
                    .padding(.trailing, 24)
            }

        }
    }
    
    var signin: some View {
        Button {
            Task {
                if await viewModel.signInWithEmailPassword() {
                    print("DEBUG: LoginView", viewModel.authenticationState == .authenticated ? "авторизован" : "не авторизован")
                } else {
                    print("DEBUG: LoginView - что то не так", viewModel.errorMessage)
                }
            }
        } label: {
            PrimaryButtonView(title: "Sign In")
        }
    }
    
    var signup: some View {
        NavigationLink {
            RegistrationView()
                .toolbar(.hidden, for: .navigationBar)
        } label: {
            HStack {
                Text("Don't have an account?")
                
                Text("Sign Up")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView().environmentObject(AuthViewModel())
        }
    }
}
