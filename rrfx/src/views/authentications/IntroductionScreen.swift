import SwiftUI

struct IntroductionScreen: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.662, green: 0.733, blue: 0.968),
                    Color(red: 0.850, green: 0.898, blue: 0.988)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                // Top logo & description
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image("logo-rrfx")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("RRFX")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.primaryColor)
                    }

                    Text("Mulai Pengalaman Trading Forex, Komoditi dan Indeks Saham jadi lebih tenang dengan strategi yang tepat bersama RRFX.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }

                Spacer()

                // ✅ Navigation Buttons
                VStack(spacing: 16) {
                    NavigationLink(destination: LoginScreen()) {
                        Text("Masuk")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColors.primaryColor)
                            .cornerRadius(8)
                    }

                    NavigationLink(destination: RegisterScreen()) {
                        Text("Daftar")
                            .font(.headline)
                            .foregroundColor(AppColors.primaryColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(AppColors.primaryColor, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)

                // Bottom info
                VStack(spacing: 12) {
                    Text("Dengan mendaftar, Anda menyetujui **Kebijakan Privasi** dan **Syarat & Ketentuan** aplikasi RRFX.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)

                    HStack(spacing: 20) {
                        Image("bappebti").resizable().aspectRatio(contentMode: .fit).frame(height: 30)
                        Image("jfx").resizable().aspectRatio(contentMode: .fit).frame(height: 30)
                        Image("kilangberjangka").resizable().aspectRatio(contentMode: .fit).frame(height: 30)
                        Image("ojk").resizable().aspectRatio(contentMode: .fit).frame(height: 30)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    IntroductionScreen()
}
