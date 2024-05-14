import SwiftUI

struct LoginView: View {
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.blue, .yellow])
    let gradient2 = Gradient(colors: [.green, .red])
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .modifier(AnimatableGradientModifier(
                    fromGradient: gradient1,
                    toGradient: gradient2,
                    progress: progress))
                .ignoresSafeArea()
            
            GlassView (content:
                        VStack {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                Button(action: {
                    // Save the email
                    saveEmail(email: email)
                    // Handle login action
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5.0)
                }
                .padding(.top, 20)
            }
                .padding())
            .frame(height: UIScreen.main.bounds.height * 0.6) // Set glass view height to cover 60% of screen
            .alignmentGuide(.bottom, computeValue: { dimension in
                dimension[.bottom] - (UIScreen.main.bounds.height * 0.4) // Stick glass view to the bottom
            })
        }
        .onAppear {
            withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                self.progress = 1.0
            }
        }
    }
}
