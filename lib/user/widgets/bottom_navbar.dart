import 'package:ai_study/user/provider_logic/dashborad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatelessWidget {

  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    final provider = context.read<DashboardProvider>();

    return NavigationBar(

      selectedIndex: currentIndex,

      onDestinationSelected: provider.changeIndex,

      destinations: const [

        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined),
          label: "Library",
        ),

        NavigationDestination(
          icon: Icon(Icons.smart_toy_outlined),
          label: "AI Chat",
        ),

        NavigationDestination(
          icon: Icon(Icons.trending_up),
          label: "Progress",
        ),

        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),

      ],

    );
  }
}