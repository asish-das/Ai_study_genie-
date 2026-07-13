import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),

            blurRadius: 20,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                width: 120,

                height: 120,

                child: Stack(
                  alignment: Alignment.center,

                  children: [
                    SizedBox(
                      width: 110,

                      height: 110,

                      child: CircularProgressIndicator(
                        value: provider.progress / 100,

                        strokeWidth: 10,

                        backgroundColor: const Color(0xffECEEF0),

                        color: const Color(0xff2563EB),
                      ),
                    ),

                    Text(
                      "${provider.progress}%",

                      style: const TextStyle(
                        fontSize: 26,

                        fontWeight: FontWeight.bold,

                        color: Color(0xff004AC6),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Today's Progress",

                      style: TextStyle(
                        fontSize: 24,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "You're on fire! Only 2 more modules to reach your daily goal.",

                      style: TextStyle(color: Color(0xff434655), height: 1.4),
                    ),

                    const SizedBox(height: 18),

                    Wrap(
                      spacing: 10,

                      runSpacing: 10,

                      children: const [
                        ProgressChip(
                          text: "3h 45m Studied",

                          bg: Color(0xffE0F7FF),

                          color: Color(0xff00668A),
                        ),

                        ProgressChip(
                          text: "12 Flashcards Mastered",

                          bg: Color(0xffDFFFEF),

                          color: Color(0xff006242),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,

            height: 52,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004AC6),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              onPressed: () {},

              child: const Text(
                "Continue Learning",

                style: TextStyle(
                  color: Colors.white,

                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressChip extends StatelessWidget {
  final String text;

  final Color bg;

  final Color color;

  const ProgressChip({
    super.key,

    required this.text,

    required this.bg,

    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

      decoration: BoxDecoration(
        color: bg,

        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        text,

        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
