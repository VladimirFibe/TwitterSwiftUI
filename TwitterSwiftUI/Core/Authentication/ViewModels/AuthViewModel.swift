import SwiftUI
import FirebaseAuth
import FirebaseFirestore

enum AuthenticationState {
  case unauthenticated
  case authenticating
  case authenticated
}

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email = "vladimir@fibeapp.ru"
    @Published var password = "123456"
    @Published var username = "macuser"
    @Published var fullname = "Vladimir Fibe"
    @Published var user: User?
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var errorMessage = ""
    init() {
        registerAuthStateHandler()
    }
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.user = user
                self.authenticationState = user == nil ? .unauthenticated : .authenticated
            }
        }
    }
}

extension AuthViewModel {
    func signInWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            try await Auth.auth().signIn(withEmail: self.email, password: self.password)
            return true
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signUpWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let data: [String: Any] = [
                "email": email,
                "username": username.lowercased(),
                "fullname": fullname,
                "uid": uid]
            try await Firestore.firestore().collection("persons").document(uid).setData(data)
            return true
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
