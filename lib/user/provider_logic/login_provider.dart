import 'package:ai_study/user/screens/subject_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  bool hidePassword = true;

  void passwordVisibility() {
    hidePassword = !hidePassword;

    notifyListeners();
  }

  Future<void> loginUser({
    required String email,

    required String password,

    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );

      return;
    }

    try {
      loading = true;

      notifyListeners();

      await auth.signInWithEmailAndPassword(email: email, password: password);

      loading = false;

      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Successful")));

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const SelectSubjectScreen()),
      );
    } on FirebaseAuthException catch (error) {
      loading = false;

      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }
}
