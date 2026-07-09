import 'package:ai_study/screens/subject_selection_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> floating;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    floating = Tween<double>(begin: 0, end: -10).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9fb),

      body: SafeArea(
        child: Stack(
          children: [
            // top glow
            Positioned(
              right: -100,
              top: -100,

              child: Container(
                width: 300,
                height: 300,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xffdbe1ff).withOpacity(.7),
                ),
              ),
            ),

            // bottom glow
            Positioned(
              left: -100,
              bottom: -100,

              child: Container(
                width: 300,
                height: 300,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(0xffc4e7ff).withOpacity(.7),
                ),
              ),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.all(16),

                width: 440,

                constraints: const BoxConstraints(minHeight: 760),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(32),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 32,

                      offset: const Offset(0, 10),

                      color: Colors.black.withOpacity(.10),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // APP NAME
                    const Text(
                      "StudyGenie AI",

                      style: TextStyle(
                        fontSize: 24,

                        fontWeight: FontWeight.bold,

                        color: Color(0xff004ac6),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SizedBox(
                            height: 320,

                            width: 320,

                            child: Stack(
                              alignment: Alignment.center,

                              children: [
                                Container(
                                  width: 260,
                                  height: 260,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    color: const Color(
                                      0xff40c2fd,
                                    ).withOpacity(.08),
                                  ),
                                ),

                                // center AI box
                                AnimatedBuilder(
                                  animation: floating,

                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(0, floating.value),

                                      child: child,
                                    );
                                  },

                                  child: Container(
                                    height: 160,
                                    width: 160,

                                    decoration: BoxDecoration(
                                      color: const Color(0xff2563eb),

                                      borderRadius: BorderRadius.circular(24),

                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 25,

                                          color: Colors.black.withOpacity(.20),
                                        ),
                                      ],
                                    ),

                                    child: const Icon(
                                      Icons.smart_toy,

                                      size: 70,

                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                floatingBox(
                                  top: 30,

                                  left: 20,

                                  icon: Icons.menu_book,

                                  color: const Color(0xff004ac6),
                                ),

                                floatingBox(
                                  bottom: 70,

                                  right: 10,

                                  icon: Icons.quiz,

                                  color: Color(0xff00668a),
                                ),

                                floatingBox(
                                  top: 90,

                                  right: 40,

                                  icon: Icons.summarize,

                                  color: Color(0xff006242),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),

                            child: Text(
                              "Master Any Subject with AI",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 28,

                                height: 1.2,

                                fontWeight: FontWeight.bold,

                                color: Color(0xff191c1e),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),

                            child: Text(
                              "StudyGenie summarizes your PDFs, creates quizzes, and answers your questions in seconds.",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 16,

                                height: 1.5,

                                fontWeight: FontWeight.w500,

                                color: Color(0xff434655),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        indicator(true),


                        indicator(false),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          TextButton(
                            onPressed: () {},

                            child: const Text(
                              "Skip",

                              style: TextStyle(
                                fontSize: 14,

                                fontWeight: FontWeight.w600,

                                color: Color(0xff434655),
                              ),
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2563eb),

                              padding: const EdgeInsets.symmetric(
                                horizontal: 48,

                                vertical: 16,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),

                              elevation: 8,
                            ),

                            onPressed: () {Navigator.push(context, MaterialPageRoute( builder: (context) => const SelectSubjectScreen()));},

                            child: const Row(
                              children: [
                                Text(
                                  "Next",

                                  style: TextStyle(
                                    color: Colors.white,

                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(width: 8),

                                Icon(
                                  Icons.arrow_forward,

                                  color: Colors.white,

                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget indicator(bool active) {
    return Container(
      margin: const EdgeInsets.all(4),

      width: active ? 32 : 8,

      height: 8,

      decoration: BoxDecoration(
        color: active ? const Color(0xff004ac6) : const Color(0xffe0e3e5),

        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget floatingBox({
    double? top,
    double? bottom,
    double? left,
    double? right,

    required IconData icon,

    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,

      child: AnimatedBuilder(
        animation: floating,

        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, floating.value),

            child: child,
          );
        },

        child: Container(
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.75),

            borderRadius: BorderRadius.circular(18),

            boxShadow: [
              BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(.12)),
            ],
          ),

          child: Icon(icon, size: 32, color: color),
        ),
      ),
    );
  }
}
