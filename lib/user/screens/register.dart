import 'package:ai_study/user/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_logic/register_provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RegisterProvider>();

    return Scaffold(
      backgroundColor: const Color(0xfff7f9fb),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // APP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.arrow_back,

                      color: Color(0xff004ac6),
                    ),
                  ),

                  const Row(
                    children: [
                      Icon(Icons.auto_awesome, color: Color(0xff004ac6)),

                      SizedBox(width: 8),

                      Text(
                        "StudyGenie AI",

                        style: TextStyle(
                          fontSize: 24,

                          fontWeight: FontWeight.bold,

                          color: Color(0xff004ac6),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 40),

              const Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Join StudyGenie AI",

                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 5),

              const Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Start your personalized learning journey today.",

                  style: TextStyle(fontSize: 16, color: Color(0xff434655)),
                ),
              ),

              const SizedBox(height: 35),

              socialButton("Sign up with Google", Colors.white, Colors.black),

              const SizedBox(height: 15),

              socialButton(
                "Sign up with Apple",

                Color(0xff191c1e),

                Colors.white,
              ),

              const SizedBox(height: 30),

              Row(
                children: const [
                  Expanded(child: Divider()),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),

                    child: Text("or"),
                  ),

                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 30),

              input(
                "Full Name",

                Icons.person_outline,

                "John Doe",

                nameController,

                false,

                provider,
              ),

              const SizedBox(height: 20),

              input(
                "Email Address",

                Icons.mail_outline,

                "name@university.edu",

                emailController,

                false,

                provider,
              ),

              const SizedBox(height: 20),

              input(
                "Password",

                Icons.lock_outline,

                "Min. 8 characters",

                passwordController,

                true,

                provider,
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 56,

                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2563eb),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),

                  onPressed: () {
                    provider.createAccount(
                      name: nameController.text.trim(),

                      email: emailController.text.trim(),

                      password: passwordController.text.trim(),

                      context: context,
                    );
                  },

                  child: provider.loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Create Account",

                          style: TextStyle(
                            color: Colors.white,

                            fontSize: 20,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "By signing up, you agree to our Terms of Service and Privacy Policy.",

                textAlign: TextAlign.center,

                style: TextStyle(color: Color(0xff737686)),
              ),

              const SizedBox(height: 25),

              TextButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                
              }
                ,child: const Text(
                  "Already have an account? Log In",
                
                  style: TextStyle(
                    color: Color(0xff004ac6),
                
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(String text, Color bg, Color textColor) {
    return Container(
      height: 50,

      decoration: BoxDecoration(
        color: bg,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: const Color(0xffc3c6d7)),
      ),

      child: Center(
        child: Text(
          text,

          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget input(
    String title,
    IconData icon,
    String hint,
    TextEditingController controller,
    bool password,
    RegisterProvider provider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 8),

        TextField(
          controller: controller,

          obscureText: password ? provider.hidePassword : false,

          decoration: InputDecoration(
            filled: true,

            fillColor: const Color(0xfff2f4f6),

            prefixIcon: Icon(icon),

            suffixIcon: password
                ? IconButton(
                    onPressed: () {
                      provider.changePasswordVisibility();
                    },

                    icon: Icon(
                      provider.hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : null,

            hintText: hint,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),

              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
