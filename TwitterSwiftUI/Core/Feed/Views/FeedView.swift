import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        content
            .overlay(
                Button(action: {
                    showNewTweetView.toggle()
                }) {
                    Image("tweet")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                        .padding()
                        .background(Color(.systemBlue))
                        .clipShape(Circle())
                        .padding()
                }
            , alignment: .bottomTrailing)
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
    }
    
    var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 25) { _ in
                    TweetRowView()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
