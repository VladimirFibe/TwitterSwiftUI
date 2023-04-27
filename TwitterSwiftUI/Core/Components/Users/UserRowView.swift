import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12.0) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4.0) {
                Text("joker")
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

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
