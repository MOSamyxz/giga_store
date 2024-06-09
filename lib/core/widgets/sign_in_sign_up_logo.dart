import 'package:e_commerce/core/constants/assets.dart';
import 'package:flutter/material.dart';

class SignInSignUpLogo extends StatelessWidget {
  const SignInSignUpLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      scale: 2.9,
    );
  }
}
