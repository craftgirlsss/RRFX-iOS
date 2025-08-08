import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var user: LoginResponse? = nil
    @Published var errorMessage: String?

    func login() {
        AuthenticationController.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let loginResponse):
                DispatchQueue.main.async {
                    self.user = loginResponse
                    self.errorMessage = nil
                    print("Login sukses!")
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print("Login gagal: \(error.localizedDescription)")
                }
            }
        }
    }
}

