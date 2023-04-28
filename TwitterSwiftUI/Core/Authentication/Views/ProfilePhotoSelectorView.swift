import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(text: "Create your account\nSelect a profile photo")
            Button {
                print("pick image here ...")
            } label: {
                Image("plus_photo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 180, height: 180)
            }
            Spacer()

        }
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
