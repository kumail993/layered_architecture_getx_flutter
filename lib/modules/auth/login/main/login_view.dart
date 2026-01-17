import 'package:ads_client/core/theme/app_colors.dart';
import 'package:ads_client/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     backgroundColor: kcBackgroundColor,
      body: Center(
        child: MyTextField(
          controller: TextEditingController(text: 'Hello'),
          hintText: 'Enter your text',
        ),
      ),
    );
  }
}
