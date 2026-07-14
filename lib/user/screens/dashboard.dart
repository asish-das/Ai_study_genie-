import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:ai_study/user/widgets/dashborad/progres_card.dart';
import 'package:ai_study/user/widgets/dashborad/quick_actions.dart';
import 'package:ai_study/user/widgets/dashborad/recent_notes.dart';
import 'package:ai_study/user/widgets/dashborad/upcoming_exam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/dashborad/dashboard_appbar.dart';
import '../widgets/dashborad/bottom_navbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<DashboardProvider>();

    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: DashboardAppBar(),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child:
        Column(

  children: [

    const ProgressCard(),

            QuickActions(),

            SizedBox(height: 24),

            RecentNotes(),

            SizedBox(height: 24),

            UpcomingExam(),

            SizedBox(height: 24),

  ],

) 

            /// Progress Card
            /// Quick Actions
            /// Recent Notes
            /// Upcoming Exams
            /// Study Tip
            /// Activity Timeline

       

      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: provider.currentIndex,
      ),

    );
  }
}
