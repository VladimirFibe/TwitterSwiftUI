import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 12.0) {
                Circle()
                    .frame(width: 56, height: 56)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal)
            buttons
                .padding(.horizontal)
            Divider()
        }
    }
    let names = ["bubble.left", "arrow.2.squarepath", "heart", "bookmark"]
    var buttons: some View {
        HStack {
            ForEach(names, id: \.self) { name in
                Button {
                    
                } label: {
                    Image(systemName: name)
                        .font(.subheadline)
                        .tint(.gray)
                }
                if name != names.last {
                    Spacer()
                }
            }
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
