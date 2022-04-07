import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:trinityauth/screens/authentificate/authentificate_screen.dart';
import 'package:trinityauth/screens/splashscreen_wrapper.dart';
import 'package:trinityauth/services/authentification.dart';
import 'package:trinityauth/themes.dart';
import 'package:trinityauth/utils/user_preferences.dart';
import 'common/models/user.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinityauth/page/profile_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
