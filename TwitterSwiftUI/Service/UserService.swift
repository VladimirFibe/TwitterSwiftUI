import FirebaseFirestoreSwift
import Firebase

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping (Person?) -> Void) {
        Firestore.firestore().collection("persons")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let person = try? snapshot?.data(as: Person.self) else {
                    completion(nil)
                    return
                }
                completion(person)
            }
    }
}
