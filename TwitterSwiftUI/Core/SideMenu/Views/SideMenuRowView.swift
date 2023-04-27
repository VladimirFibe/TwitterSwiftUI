import SwiftUI

struct SideMenuRowView: View {
    let row: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: row.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(row.title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(height: 40)
    }
}
