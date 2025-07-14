import 'package:flutter_application_1/core/common.dart';

class LoginController {
  ValueNotifier<String> selectButton = ValueNotifier("Log In");
  final buttons = ['Log In', 'Register'];
  final key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();

  dispose() {
    selectButton.dispose();
    email.dispose();
    password.dispose();
    dob.dispose();
  }
}
