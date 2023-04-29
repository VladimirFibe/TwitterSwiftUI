import SwiftUI
import FirebaseFirestoreSwift

struct ExploreView: View {
    @FirestoreQuery(collectionPath: "persons") var persons: [Person]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(persons) { person in
                    NavigationLink(destination: ProfileView(person)) {
                        UserRowView(person: person)
                    }
                }
            }
        }
        .padding()
        .tint(.black)
    }
}
