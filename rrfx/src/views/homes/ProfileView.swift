import SwiftUI

struct ProfileView: View {
    let user: LoginResponse

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(user.response.personal_detail.name)")
            Text("Email: \(user.response.personal_detail.email)")
            Text("Token: \(user.response.access_token)")
        }
        .navigationTitle("Profile")
    }
}
