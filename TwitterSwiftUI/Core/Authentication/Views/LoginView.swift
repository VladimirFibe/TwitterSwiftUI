import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack {
            header
            fields
            forgotPassword
            signin
            Spacer()
            signup
        }
    }
    var header: some View {
            Text("Hello\nWelcome Back")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(height: 260)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(RoundedShape(corners: .bottomRight))
                .ignoresSafeArea()
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
            
        } label: {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
                .padding(.top)
                .padding(.horizontal, 24)
                .shadow(color: .gray.opacity(0.5), radius: 10)
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
            LoginView()
        }
    }
}
