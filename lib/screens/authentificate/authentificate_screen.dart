import 'package:flutter/material.dart';
import 'package:trinityauth/common/constant.dart';
import 'package:trinityauth/services/authentification.dart';

import '../../common/loading.dart';

class AuthentificateScreen extends StatefulWidget {
  const AuthentificateScreen({Key? key}) : super(key: key);

  @override
  State<AuthentificateScreen> createState() => _AuthentificateScreenState();
}

class _AuthentificateScreenState extends State<AuthentificateScreen> {
  final AuthentificationService _auth = AuthentificationService();
  final _formKey = GlobalKey<FormState>();
  // Permet de valider les champs de saisies
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _formKey.currentState?.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              elevation: 0.0,
              title: Text(
                  showSignIn ? 'Sign in to Trinity' : 'Register to Trinity',
                  style: const TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  label: Text(showSignIn ? 'Register' : 'Sign in'),
                  onPressed: () => toggleView(),
                )
              ],
            ),
            body: Container(
              margin: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Enter a password with a least 6 characters'
                          : null,
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      child: Text(
                        showSignIn ? 'Sign in' : 'Register',
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          var email = emailController.value.text;
                          var password = passwordController.value.text;
                          print(password);

                          dynamic result = showSignIn
                              ? await _auth.signInWithEmailAndPassword(
                                  email, password)
                              : await _auth.registerWithEmailAndPassword(
                                  email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Please supply a valid email';
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
