import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            AuthHeaderView(text: "Get started.\nCreate your account")
            fields
            signup
            Spacer()
            signin
        }
    }
    var fields: some View {
        VStack(spacing: 40) {
            CustomInputField(image: "envelope", placeholder: "Email", text: $viewModel.email)
            CustomInputField(image: "person", placeholder: "Username", text: $viewModel.username)
            CustomInputField(image: "person", placeholder: "Full name", text: $viewModel.fullname)
            CustomInputField(image: "lock", placeholder: "Password", text: $viewModel.password)
        }
        .padding(.horizontal, 32)
    }
    var signup: some View {
        Button {
            Task {
                if await viewModel.signUpWithEmailPassword() {
                    print("DEBUG: LoginView", viewModel.authenticationState == .authenticated ? "авторизован" : "не авторизован")
                }
            }
        } label: {
            PrimaryButtonView(title: "Sign Up")
        }
    }
    
    var signin: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Already have an account?")
                Text("Sign In")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environmentObject(AuthViewModel())
    }
}
