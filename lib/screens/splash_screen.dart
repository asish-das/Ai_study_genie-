import 'package:ai_study/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController fadeController;
  late AnimationController floatController;
  late AnimationController spinnerController;

  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> floatAnimation;

  @override
  void initState() {
    super.initState();

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController);

    scaleAnimation = Tween<double>(
      begin: .95,
      end: 1,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeOut));

    fadeController.forward();

    floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    floatAnimation = Tween<double>(begin: 0, end: -8).animate(floatController);

    spinnerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  
 Future.delayed(
    const Duration(seconds: 3),
    (){


      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder:(context)
          => const LoginScreen(),

        ),

      );


    },

  );}
  @override
  void dispose() {
    fadeController.dispose();
    floatController.dispose();
    spinnerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            // top blue glow
            Positioned(
              top: -80,
              right: -60,

              child: Container(
                width: 250,
                height: 250,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xff40c2fd).withOpacity(.15),
                ),
              ),
            ),

            // bottom glow
            Positioned(
              bottom: -70,
              left: -60,

              child: Container(
                width: 230,
                height: 230,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xffdbe1ff).withOpacity(.6),
                ),
              ),
            ),

            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Spacer(),

                  FadeTransition(
                    opacity: fadeAnimation,

                    child: ScaleTransition(
                      scale: scaleAnimation,

                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: floatAnimation,

                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, floatAnimation.value),

                                child: child,
                              );
                            },

                            child: Image.network(
                              "https://lh3.googleusercontent.com/aida/AP1WRLvx17E_fKiQVD_hIK10IdPJuEOu4BfXehrxO3gUvnb6_QAKgp82WjQY3RoWgz_bcjOPb_Fvloq-loxe38i8nFDwxwIeeMJzYcumAyGDteuFG3KPvXXwn-AvEiYp5wLPeE_4hf47jFjDU1vH7jFklMbDMqK9puhyuP7GjAguIKWqsVdP5eYQDQ9VLQVEV6HZZRzUOMMruZv58ss7kT-iKmwglzzJnDFTi5NF9pECZgYIfMELZRw6OJgaZawg",

                              width: 180,
                              height: 180,
                            ),
                          ),

                          const SizedBox(height: 25),

                          const Text(
                            "StudyGenie AI",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 32,

                              fontWeight: FontWeight.bold,

                              color: Color(0xff004ac6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  AnimatedBuilder(
                    animation: spinnerController,

                    builder: (context, child) {
                      return Transform.rotate(
                        angle: spinnerController.value * 2 * math.pi,

                        child: child,
                      );
                    },

                    child: const SizedBox(
                      height: 48,
                      width: 48,

                      child: CircularProgressIndicator(
                        strokeWidth: 4,

                        backgroundColor: Color(0xffF1F5F9),

                        valueColor: AlwaysStoppedAnimation(Color(0xff004ac6)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Synchronizing context...",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 14,

                      fontWeight: FontWeight.w600,

                      color: const Color(0xff434655).withOpacity(.6),
                    ),
                  ),

                  const Spacer(),

                  FadeTransition(
                    opacity: fadeAnimation,

                    child: Column(
                      children: [
                        const Text(
                          "Your AI Study Companion",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 16,

                            fontWeight: FontWeight.w500,

                            color: Color(0xff737686),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          height: 4,
                          width: 32,

                          decoration: BoxDecoration(
                            color: const Color(0xff004ac6).withOpacity(.25),

                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
