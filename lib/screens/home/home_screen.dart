import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinityauth/common/loading.dart';
import 'package:trinityauth/common/models/user.dart';
import 'package:trinityauth/screens/home/user_list.dart';
import 'package:trinityauth/services/database.dart';

import '../../services/authentification.dart';

class HomeScreen extends StatelessWidget {
  final AuthentificationService _auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) throw Exception("user not found");
    final database = DatabaseService(user.uid);
    return StreamProvider<List<AppUserData>>.value(
      initialData: [],
      value: database.users,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: const Text('Water Social'),
          actions: <Widget>[
            StreamBuilder<AppUserData>(
              stream: database.user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  AppUserData? userData = snapshot.data;
                  if (userData == null) return const Loading();
                  return TextButton.icon(
                    icon: const Icon(
                      Icons.wine_bar,
                      color: Colors.white,
                    ),
                    label: const Text('drink',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      await database.saveUser(
                          userData.email, userData.waterCounter + 1);
                    },
                  );
                } else {
                  return const Loading();
                }
              },
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label:
                  const Text('logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: const UserList(),
      ),
    );
  }
}
