import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(text: "Hello\nWelcome Back")
            fields
            forgotPassword
            signin
            Spacer()
            signup
        }
    }
    
    var fields: some View {
        VStack(spacing: 40) {
            CustomInputField(image: "envelope", placeholder: "Email", text: $email)
            CustomInputField(image: "lock", placeholder: "Password", text: $password)
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
            viewModel.login(withEmail: email, password: password)
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
