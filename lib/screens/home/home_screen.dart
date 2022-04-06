import 'package:flutter/material.dart';

import '../../services/authentification.dart';

class HomeScreen extends StatelessWidget {
  final AuthentificationService _auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: Text('Trinity App'),
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                }),
          ]),
    );
  }
}
