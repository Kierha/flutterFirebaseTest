import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinityauth/screens/authentificate/authentificate_screen.dart';
import 'package:trinityauth/screens/splashscreen_wrapper.dart';
import 'package:trinityauth/services/authentification.dart';

import 'common/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthentificationService().user,
      initialData: null,
      child: MaterialApp(
        home: const SplashScreenWrapper(),
        theme: ThemeData(
          primaryColorDark: Colors.black,
        ),
      ),
    );
  }
}
