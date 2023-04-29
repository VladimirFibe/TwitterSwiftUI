import SwiftUI

struct UserRowView: View {
    let person: Person
    var body: some View {
        HStack(spacing: 12.0) {
            AsyncImage(url: URL(string: person.profileImageUrl), content: { image in
                image.resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            }, placeholder: {
                ProgressView()
            })
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(person.username)
                    .bold()
                Text("Heath Ledger")
                    .foregroundColor(.gray)
            }
            .font(.subheadline)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
