import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            header
            buttons
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
                HStack {
                    Label("Almaty", systemImage: "mappin.and.ellipse")
                    Label("fibeapp.ru", systemImage: "link")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}


extension ProfileView {
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
