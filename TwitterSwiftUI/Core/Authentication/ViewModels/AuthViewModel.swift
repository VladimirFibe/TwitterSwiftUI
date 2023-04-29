import SwiftUI
import FirebaseAuth
import FirebaseFirestore

enum AuthenticationState {
    case unauthenticated
    case authenticating
    case selectingPhoto
    case authenticated
    case imageLoading
    case creatingUser
}

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email = "vladimir@fibeapp.ru"
    @Published var password = "123456"
    @Published var username = "macuser"
    @Published var fullname = "Vladimir Fibe"
    @Published var user: User?
    @Published var person: Person?
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var errorMessage = ""
    private let userservice = UserService()
    
    init() {
        registerAuthStateHandler()
    }
    
    private func reset() {
        person = nil
        email = ""
        password = ""
        username = ""
        fullname = ""
        errorMessage = ""
    }
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.user = user
                switch self.authenticationState {
                    
                case .unauthenticated:
                    if user != nil { self.authenticationState = .authenticated}
                case .authenticating:
                    self.authenticationState = user == nil ? .unauthenticated : .authenticated
                case .selectingPhoto:
                    print("DEBUG: selectingPhoto")
                case .authenticated:
                    self.authenticationState = user == nil ? .unauthenticated : .authenticated
                case .imageLoading:
                    print("DEBUG: imageLoading")
                case .creatingUser:
                    print("DEBUG: creatingUser")
                }
                if user != nil {
                    self.fetchUser()
                }
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
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signUpWithEmailPassword() async -> Bool {
        authenticationState = .creatingUser
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let data: [String: Any] = [
                "email": email,
                "username": username.lowercased(),
                "fullname": fullname,
                "uid": uid]
            try await Firestore.firestore().collection("persons").document(uid).setData(data)
            authenticationState = .selectingPhoto
            return true
        } catch {
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            reset()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            reset()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        authenticationState = .imageLoading
        ImageUploader.uploadImage(image: image) { url in
            guard let uid = self.user?.uid else {
                self.authenticationState = .authenticated
                return
            }
            Firestore.firestore()
                .collection("persons")
                .document(uid)
                .updateData(["profileImageUrl": url]) { _ in
                    self.authenticationState = .authenticated
                }
        }
    }
    
    func fetchUser() {
        guard let uid = user?.uid else {
            print("DEBUG: no user")
            return }
        userservice.fetchUser(withUid: uid) { person in
            DispatchQueue.main.async {
                self.person = person
            }
        }
    }
}
