import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 15) { item in
                    NavigationLink(destination: ProfileView()) {
                        UserRowView()
                    }
                }
            }
        }
        .padding()
        .tint(.black)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExploreView()
        }
        
    }
}
