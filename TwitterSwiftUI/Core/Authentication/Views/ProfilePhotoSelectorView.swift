import SwiftUI

struct ProfilePhotoSelectorView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {
        VStack {
            AuthHeaderView(text: "Create your account\nSelect a profile photo")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                }
            }
            .frame(width: 180, height: 180)
            
            if let profileImage {
                Button {
                    
                } label: {
                    PrimaryButtonView(title: "Continue")
                }

            }
            Spacer()

        }
        .sheet(isPresented: $showImagePicker,
               onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    func loadImage() {
        guard let selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
            .environmentObject(AuthViewModel())
    }
}
