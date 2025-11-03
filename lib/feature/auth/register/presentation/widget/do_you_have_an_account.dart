import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/login/presentation/login_view.dart';

class DoYouHaveAnAccount extends StatelessWidget {
  const DoYouHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Do You Have An Account ? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          },
          child: Text(
            "Login in",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
