import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinityauth/screens/authentificate/authentificate_screen.dart';
import 'package:trinityauth/screens/home/home_screen.dart';

import '../common/models/user.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const AuthentificateScreen();
    } else {
      return HomeScreen();
    }
  }
}
