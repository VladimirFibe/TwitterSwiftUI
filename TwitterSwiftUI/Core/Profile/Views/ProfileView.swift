import SwiftUI

struct ProfileView: View {
    @State private var selectedFilters: TweetFilterViewModel = .tweets
    @Environment(\.dismiss) var dismiss
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading) {
            header
            buttons
            userInfoDetails
            tweetFilterBar
            tweetsView
            
            Spacer()
        }
    }
}


extension ProfileView {
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<9) { _ in
                    TweetRowView()
                        .padding(.vertical)
                }
            }
        }
    }
    var tweetFilterBar: some View {
        HStack(alignment: .top) {
            ForEach(TweetFilterViewModel.allCases) { title in
                VStack {
                    Text(title.rawValue)
                        .font(.subheadline)
                        .fontWeight(selectedFilters == title ? .semibold : .regular)
                        .frame(maxWidth: .infinity)
                    if selectedFilters == title {
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(Color(.systemBlue))
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(.clear)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        selectedFilters = title
                    }
                }
            }
        }
        .overlay(Divider(), alignment: .bottom)
    }
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            HStack(spacing: 24) {
                Label("Almaty", systemImage: "mappin.and.ellipse")
                Label("fibeapp.ru", systemImage: "link")
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var buttons: some View {
        HStack(spacing: 12) {
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .padding(6)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            }
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(Capsule().stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
        .tint(.black)
    }
    var header: some View {
        Color(.systemBlue)
            .ignoresSafeArea()
            .frame(height: 96)
            .overlay(
                VStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .tint(.white)
                        
                    }

                    Circle()
                        .frame(width: 72, height: 72)
                }
                .offset(x: 16, y: 24)
                , alignment: .bottomLeading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
