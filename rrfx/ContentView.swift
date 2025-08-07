import SwiftUI

struct ContentView: View {
    @State private var isShowingLogin = false
    var body: some View {
        IntroductionScreen(isShowingLogin: $isShowingLogin)
            .fullScreenCover(isPresented: $isShowingLogin) {
                LoginScreen(isShowingLogin: $isShowingLogin)
            }
    }
}

#Preview {
    ContentView()
}
