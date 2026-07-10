import 'package:ai_study/user/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

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
                      Image.network(
                        "https://lh3.googleusercontent.com/aida/AP1WRLvx17E_fKiQVD_hIK10IdPJuEOu4BfXehrxO3gUvnb6_QAKgp82WjQY3RoWgz_bcjOPb_Fvloq-loxe38i8nFDwxwIeeMJzYcumAyGDteuFG3KPvXXwn-AvEiYp5wLPeE_4hf47jFjDU1vH7jFklMbDMqK9puhyuP7GjAguIKWqsVdP5eYQDQ9VLQVEV6HZZRzUOMMruZv58ss7kT-iKmwglzzJnDFTi5NF9pECZgYIfMELZRw6OJgaZawg",

                        width: 60,
                        height: 60,
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

                        obscureText: hidePassword,

                        decoration: InputDecoration(
                          filled: true,

                          fillColor: const Color(0xfff2f4f6),

                          prefixIcon: const Icon(
                            Icons.lock_outline,

                            color: Color(0xff737686),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),

                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                          },

                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                "Sign In",

                                style: TextStyle(
                                  fontSize: 14,

                                  fontWeight: FontWeight.w600,

                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(width: 8),

                              Icon(Icons.arrow_forward, color: Colors.white),
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

                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Color(0xff434655)),

                          children: [
                            TextSpan(text: "Don't have an account? "),

                            TextSpan(
                              text: "Create an Account",

                              style: TextStyle(
                                color: Color(0xff004ac6),

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
