class Validators {

  Validators._();

  static String? email(String value) {

    if (value.trim().isEmpty) {
      return "Email is required";
    }

    return null;
  }

  static String? password(String value) {

    if (value.trim().isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

}