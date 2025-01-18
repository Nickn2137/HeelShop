import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image("user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("JustaChillGuy52")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("These plants are awesome!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 160, alignment: .leading)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("11:11 am")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 72)
        
        HStack(alignment: .top, spacing: 12) {
            Image("plant")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .cornerRadius(10)
                .overlay(
                    Image("user")
                        .resizable()
                        .frame(width: 32, height: 32) // Set circular image size
                        .clipShape(Circle()) // Make the image circular
                        .shadow(radius: 5)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .offset(x: 24, y: 24)
                )
            VStack(alignment: .leading, spacing: 4) {
                Text("JustaChillGuy52")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Woahhh!!!!!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("Friday")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("4:20 pm")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
