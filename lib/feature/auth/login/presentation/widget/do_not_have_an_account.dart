import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/register/presentation/register_view.dart';

class DoNoHaveAnAccount extends StatelessWidget {
  const DoNoHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Color(0xFF32343E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RegisterView.routeName);
          },
          child: Text(
            "SIGN UP",
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
