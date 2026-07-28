import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'study_tip_card.dart';

class StudyTip extends StatelessWidget {
  const StudyTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Study Tips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.studyTips.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return StudyTipCard(studyTip: provider.studyTips[index]);
              },
            ),
          ],
        );
      },
    );
  }
}
