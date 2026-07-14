import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_card.dart';

class RecentNotes extends StatelessWidget {
  const RecentNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              "Recent Notes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff191C1E),
              ),
            ),

            TextButton(
              onPressed: () {},

              child: const Text(
                "View All",
                style: TextStyle(
                  color: Color(0xff004AC6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          ],
        ),

        const SizedBox(height: 20),

        ListView.separated(

          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: provider.notes.length,

          separatorBuilder: (_, __) =>
              const SizedBox(height: 20),

          itemBuilder: (context, index) {

            return NoteCard(

              note: provider.notes[index],

              onTap: () {

                // Later
                // Open Note Details

              },

            );

          },

        ),

      ],
    );
  }
}
