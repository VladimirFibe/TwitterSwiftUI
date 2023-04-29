import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            header
            menulist
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .frame(width: 300)
    }
    
    var menulist: some View {
        ForEach(SideMenuViewModel.allCases) { row in
            if row == .profile {
                if let person = viewModel.person {
                    NavigationLink {
                        ProfileView(person)
                    } label: {
                        SideMenuRowView(row: row)
                    }
                }
            } else if row == .logout {
                Button {
                    viewModel.signOut()
                } label: {
                    SideMenuRowView(row: row)
                }

            } else {
                SideMenuRowView(row: row)
            }
        }
    }
    var header: some View {
        VStack(alignment: .leading) {
            if let person = viewModel.person {
                AsyncImage(url: URL(string: person.profileImageUrl)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(person.fullname)
                        .font(.headline)
                    Text("@\(person.username)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView().padding(.vertical)
            }
        }
    }
}
