import 'package:ai_study/user/provider_logic/login_provider.dart';
import 'package:ai_study/user/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider loginProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginProvider = Provider.of<LoginProvider>(context);
  }

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9fb),

      body: SafeArea(
        child: Stack(
          children: [
            // TOP BLUE GLOW
            Positioned(
              top: -120,
              right: -120,

              child: Container(
                height: 350,
                width: 350,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xff40c2fd).withOpacity(.15),
                ),
              ),
            ),

            // BOTTOM GLOW
            Positioned(
              bottom: -100,
              left: -100,

              child: Container(
                height: 300,
                width: 300,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xff004ac6).withOpacity(.10),
                ),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Container(
                  width: 480,

                  padding: const EdgeInsets.all(32),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 32,

                        offset: const Offset(0, 10),

                        color: Colors.black.withOpacity(.10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      // LOGO
                      Container(
                        child: Image.asset(
                          "assets/splash.png",
                          height: 60,
                          width: 60,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "StudyGenie AI",

                        style: TextStyle(
                          fontSize: 24,

                          fontWeight: FontWeight.bold,

                          color: Color(0xff004ac6),
                        ),
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "Welcome Back",

                        style: TextStyle(
                          fontSize: 32,

                          fontWeight: FontWeight.bold,

                          color: Color(0xff191c1e),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Please enter your details to sign in.",

                        style: TextStyle(
                          fontSize: 16,

                          color: Color(0xff434655),
                        ),
                      ),

                      const SizedBox(height: 35),

                      // EMAIL LABEL
                      label("Email Address"),

                      const SizedBox(height: 8),

                      inputBox(
                        controller: emailController,

                        icon: Icons.mail_outline,

                        hint: "name@gmaiml.com",
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          label("Password"),

                          const Text(
                            "Forgot Password?",

                            style: TextStyle(
                              fontSize: 12,

                              fontWeight: FontWeight.w600,

                              color: Color(0xff004ac6),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,

                        obscureText: loginProvider.hidePassword,

                        decoration: InputDecoration(
                          filled: true,

                          fillColor: const Color(0xfff2f4f6),

                          prefixIcon: const Icon(
                            Icons.lock_outline,

                            color: Color(0xff737686),
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              loginProvider.passwordVisibility();
                            },

                            icon: Icon(
                              loginProvider.hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),

                          hintText: "••••••••",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // SIGN IN BUTTON
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
                            loginProvider.loginUser(
                              email: emailController.text.trim(),

                              password: passwordController.text.trim(),

                              context: context,
                            );
                          },

                          child: loginProvider.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white),
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        children: [
                          Expanded(child: Divider()),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),

                            child: Text(
                              "Or continue with",

                              style: TextStyle(
                                color: Color(0xff737686),

                                fontSize: 12,
                              ),
                            ),
                          ),

                          Expanded(child: Divider()),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // GOOGLE BUTTON
                      Container(
                        height: 56,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),

                          border: Border.all(color: Color(0xffe0e3e5)),
                        ),

                        child: const Center(
                          child: Text(
                            "G  Google",

                            style: TextStyle(
                              fontSize: 14,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text(
                            "Don't have an account?",

                            style: TextStyle(
                              color: Color(0xff434655),

                              fontSize: 13,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },

                            child: const Text(
                              "Create an Account",

                              style: TextStyle(
                                color: Color(0xff004ac6),

                                fontWeight: FontWeight.bold,

                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String text) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Text(
        text,

        style: const TextStyle(
          fontSize: 14,

          fontWeight: FontWeight.w600,

          color: Color(0xff191c1e),
        ),
      ),
    );
  }

  Widget inputBox({
    required TextEditingController controller,

    required IconData icon,

    required String hint,
  }) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        filled: true,

        fillColor: const Color(0xfff2f4f6),

        prefixIcon: Icon(icon, color: const Color(0xff737686)),

        hintText: hint,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
