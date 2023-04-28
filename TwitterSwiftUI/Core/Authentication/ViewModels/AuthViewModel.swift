import SwiftUI
import Firebase

final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        print(#function)
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print(#function)
    }
    
    func logout() {
        print(#function)
    }
}
