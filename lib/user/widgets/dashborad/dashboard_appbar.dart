import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(color: Color(0xff737686), fontSize: 12),
                  ),

                  SizedBox(height: 2),

                  Text(
                    "Hi, Alex!",
                    style: TextStyle(
                      color: Color(0xff004ac6),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},

              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xff004ac6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
