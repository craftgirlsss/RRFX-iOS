import SwiftUI

struct IntroductionScreen: View {
    @Binding var isShowingLogin: Bool
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.968627451, alpha: 1)),
                        Color(#colorLiteral(red: 0.8509803922, green: 0.8980392157, blue: 0.9882352941, alpha: 1))
                    ]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            VStack {
                // Top Section
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image("logo-rrfx") // Replace with your image asset
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("RRFX")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.primaryColor)
                    }

                    Text("Mulai Pengalaman Trading Forex, Komoditi dan Indeks Saham jadi lebih tenang dengan strategi yang tepat bersama RRFX.")
                        .font(.system(size: 14.0))
                        .foregroundColor(.secondary)
                } // Adds space from the top of the screen

                Spacer()

                // Middle Section (Buttons)
                VStack(spacing: 16) {
                    Button(action: {
                        isShowingLogin = true
                    }) {
                        Text("Masuk")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColors.primaryColor)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        // Action for "Daftar"
                    }) {
                        Text("Daftar")
                            .font(.headline)
                            .foregroundColor(AppColors.primaryColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(AppColors.primaryColor, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)// Add horizontal padding

                // Bottom Section (Legal & Logos)
                VStack(alignment: .center, spacing: 16) {
                    Text("Dengan mendaftar, Anda menyetujui **Kebijakan Privasi** dan **Syarat & Ketentuan** aplikasi RRFX.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                    
                    Text("PT. RRFX Investasi Berjangka Terlisensi dan Teregulasi oleh")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 20) {
                        Image("bappebti") // Replace with your image assets
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)

                        Image("jfx")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)

                        Image("kilangberjangka")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)

                        Image("ojk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                    }
                }
            }
            .padding()
        }
        }
}
