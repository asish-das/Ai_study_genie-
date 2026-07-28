import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:ai_study/user/widgets/dashborad/activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ActivityTimeline extends StatelessWidget {
  const ActivityTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Activity Timeline",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        Consumer<DashboardProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.activities.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ActivityTile(
                  activity: provider.activities[index],
                );
              },
            );
          },
        ),
      ],
    );
  }
}