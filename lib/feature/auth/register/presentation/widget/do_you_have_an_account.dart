import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/login/presentation/login_view.dart';

class DoYouHaveAnAccount extends StatelessWidget {
  const DoYouHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Color(0xFF32343E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          },
          child: Text(
            "LOG IN",
            style: TextStyle(
              color: Color(0xFFFF7622),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
