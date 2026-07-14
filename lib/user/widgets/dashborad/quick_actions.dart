import 'package:flutter/material.dart';
import 'quick_action_card.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff191C1E),
          ),
        ),

        const SizedBox(height: 20),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          crossAxisCount: 2,

          crossAxisSpacing: 16,

          mainAxisSpacing: 16,

          childAspectRatio: 1.15,

          children: [

            QuickActionCard(
              icon: Icons.upload_file,
              title: "Upload PDF",
              backgroundColor: const Color(0xffDBE1FF),
              iconColor: const Color(0xff004AC6),
              onTap: () {},
            ),

            QuickActionCard(
              icon: Icons.quiz,
              title: "Generate Quiz",
              backgroundColor: const Color(0xffC4E7FF),
              iconColor: const Color(0xff00668A),
              onTap: () {},
            ),

            QuickActionCard(
              icon: Icons.smart_toy,
              title: "AI Chat",
              backgroundColor: const Color(0xffD7FBE8),
              iconColor: const Color(0xff006242),
              onTap: () {},
            ),

            QuickActionCard(
              icon: Icons.style,
              title: "Flashcards",
              backgroundColor: const Color(0xffDBE1FF),
              iconColor: const Color(0xff004AC6),
              onTap: () {},
            ),

          ],
        ),

      ],
    );
  }
}