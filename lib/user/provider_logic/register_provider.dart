import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  bool hidePassword = true;

  void changePasswordVisibility() {
    hidePassword = !hidePassword;

    notifyListeners();
  }

  Future<void> createAccount({
    required String name,

    required String email,

    required String password,

    required BuildContext context,
  }) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Fill all fields")));

      return;
    }

    try {
      loading = true;

      notifyListeners();

      await auth.createUserWithEmailAndPassword(
        email: email,

        password: password,
      );

      loading = false;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account Created Successfully")),
      );
    } on FirebaseAuthException catch (e) {
      loading = false;

      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
