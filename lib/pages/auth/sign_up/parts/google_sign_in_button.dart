import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: SignInButton(
        Buttons.google,
        elevation: 3.0,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r), // <-- Radius
        ),
      ),
    );
  }
}
