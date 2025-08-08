import SwiftUI

struct LoginScreen: View {
    @State private var isPasswordVisible: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var isEmailValid: Bool? {
        if viewModel.email.isEmpty {
            return nil
        }
        return isValidEmail(viewModel.email)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(AppColors.secondaryColor)
            Text("back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.bottom, 15.0)

            Text("Lihat pergerakan harga pasar global secara langsung, dengan chart interaktif dan analisis teknikal lengkap.")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 20.0)

            Group {
                Text("Email Address")
                    .font(.headline)
                    .padding(.bottom, 5)
                EmailTextField(
                    placeholder: "name@email.com",
                    text: $viewModel.email,
                    iconName: "envelope",
                    isValid: isEmailValid
                )
                .padding(.bottom, 10.0)
                
                Text("Password")
                    .font(.headline)
                    .padding(.bottom, 5)

                PasswordTextField(
                    placeholder: "Create Password",
                    password: $viewModel.password,
                    isVisible: $isPasswordVisible
                )
                .padding(.bottom, 10)
            }
        
            // Tombol "Forgot Password"
            HStack(alignment: .top){
                NavigationLink(destination: ForgotPassword()) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(AppColors.secondaryColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }.padding()

            // Tombol "Sign in" dan "Continue with Google"
            Button(action: {
                viewModel.login()
            }) {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }.padding(.bottom)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }

            Button(action: {}) {
                HStack {
                    Image("icon-google") // Ganti dengan aset gambar Google Anda
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Google")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.top, 5)
            
            if let user = viewModel.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    Text("Go to Profile")
                        .foregroundColor(.blue)
                }
            }

            Spacer()

            // Teks "Register Now"
            HStack {
                Spacer()
                Text("Not Have Account?")
                    .foregroundColor(Color.gray)
                NavigationLink(destination: RegisterScreen()) {
                    Text("Register Now")
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}

#Preview {
    LoginScreen()
}
