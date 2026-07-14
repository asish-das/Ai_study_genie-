import 'package:ai_study/user/models/note_model.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Temporary static data
  String userName = "asish";
  int progress = 75;
}
class QuickAction {

  final String title;

  final IconData icon;

  final Color background;

  final Color iconColor;

  QuickAction({

    required this.title,

    required this.icon,

    required this.background,

    required this.iconColor,

  });

}
List<QuickAction> quickActions = [

  QuickAction(
    title: "Upload PDF",
    icon: Icons.upload_file,
    background: Color(0xffDBE1FF),
    iconColor: Color(0xff004AC6),
  ),

  QuickAction(
    title: "Generate Quiz",
    icon: Icons.quiz,
    background: Color(0xffC4E7FF),
    iconColor: Color(0xff00668A),
  ),

  QuickAction(
    title: "AI Chat",
    icon: Icons.smart_toy,
    background: Color(0xffD8FFE8),
    iconColor: Color(0xff006242),
  ),

  QuickAction(
    title: "Flashcards",
    icon: Icons.style,
    background: Color(0xffDBE1FF),
    iconColor: Color(0xff004AC6),
  ),

];

List<NoteModel> notes=[
];