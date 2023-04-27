import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
        
    }
}
