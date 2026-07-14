import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exam_tile.dart';

class UpcomingExam extends StatelessWidget {
  const UpcomingExam({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<DashboardProvider>();

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

          children: [

            const Text(
              "Upcoming Exams",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: () {},

              child: const Text("View All"),
            )

          ],
        ),

        const SizedBox(height: 20),

        ListView.separated(

          shrinkWrap: true,

          physics:
              const NeverScrollableScrollPhysics(),

          itemCount: provider.exams.length,

          separatorBuilder: (_, __) =>
              const SizedBox(height: 16),

          itemBuilder: (context, index) {

            return ExamTile(
              exam: provider.exams[index],
            );

          },
        ),

      ],
    );
  }
}