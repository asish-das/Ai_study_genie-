import 'package:ai_study/user/models/activity_model.dart';
import 'package:ai_study/user/models/exam_model.dart';
import 'package:ai_study/user/models/note_model.dart';
import 'package:ai_study/user/models/quick_action_model.dart';
import 'package:ai_study/user/models/study_tip_model.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Temporary static data
  String userName = "Alex";
  int progress = 75;

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

final List<NoteModel> notes = [

  const NoteModel(
    title: "Molecular Biology 101",
    subject: "Biology",
    description: "Cell structure, DNA replication and protein synthesis.",
    imageUrl: "",
    lastEdited: "2 hours ago",
  ),

  const NoteModel(
    title: "Calculus Integrals",
    subject: "Mathematics",
    description: "Definite and indefinite integration with worked examples.",
    imageUrl: "",
    lastEdited: "Yesterday",
  ),

];
List<ExamModel> exams = [

  ExamModel(
    subject: "Biology",
    title: "Final Semester Exam",
    date: "May 12",
    remainingDays: "4 days left",
  ),

  ExamModel(
    subject: "Calculus",
    title: "Midterm Revision",
    date: "May 15",
    remainingDays: "7 days left",
  ),

];

String studyTipTitle = "Study Tip";

String studyTip =
    "Take a 5-minute break after every 25 minutes of focused study to improve concentration and reduce mental fatigue.";
    
    List<ActivityModel> activities = [
  ActivityModel(
    title: "Uploaded PDF",
    subtitle: "Biology Notes",
    time: "2 hours ago",
    icon: "pdf",
  ),
  ActivityModel(
    title: "Generated Quiz",
    subtitle: "Cell Biology",
    time: "Yesterday",
    icon: "quiz",
  ),
  ActivityModel(
    title: "Completed Flashcards",
    subtitle: "20 Cards",
    time: "2 days ago",
    icon: "flashcard",
  ),
];
List<StudyTipModel> studyTips = [
  StudyTipModel(
    title: "Pomodoro Technique",
    description:
        "Study for 25 minutes, then take a 5-minute break to improve concentration and reduce mental fatigue.",
    category: "Productivity",
  ),

  StudyTipModel(
    title: "Active Recall",
    description:
        "Instead of rereading your notes, close them and try to remember the concepts from memory.",
    category: "Learning",
  ),

  StudyTipModel(
    title: "Spaced Repetition",
    description:
        "Review topics over increasing intervals instead of cramming everything in one day.",
    category: "Revision",
  ),
];
    }

