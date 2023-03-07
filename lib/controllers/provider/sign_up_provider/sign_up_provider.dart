import 'package:flutter/cupertino.dart';

class SignUpProvider with ChangeNotifier {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
