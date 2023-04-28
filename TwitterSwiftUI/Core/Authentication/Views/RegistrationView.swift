import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
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
            CustomInputField(image: "envelope", placeholder: "Email", text: $email)
            CustomInputField(image: "person", placeholder: "Username", text: $username)
            CustomInputField(image: "person", placeholder: "Full name", text: $fullname)
            CustomInputField(image: "lock", placeholder: "Password", text: $password)
        }
        .padding(.horizontal, 32)
    }
    var signup: some View {
        Button {
            viewModel.login(withEmail: email, password: password)
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
