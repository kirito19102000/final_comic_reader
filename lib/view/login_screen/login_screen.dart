import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/login_screen/components/skip_button.dart';
import 'package:final_comic_reader/view/login_screen/components/create_account.dart';
import 'package:final_comic_reader/view/login_screen/components/google_button.dart';
import 'package:final_comic_reader/view/login_screen/components/login_button.dart';
import 'package:final_comic_reader/view/login_screen/components/policy_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/login_app_bar.dart';
import 'components/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late FirebaseAuthentication auth;

  String loginMessage = '';

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: InputField(emailController, passwordController),
            ),
            // Text(loginMessage),
            // Container(margin: const EdgeInsets.only(top: 10)),
            LoginButton(auth, emailController, passwordController),
            Container(margin: const EdgeInsets.only(top: 10)),
            CreateAccount(),
            bottomDisplay(),
          ],
        ),
      ),
    );
  }

  bottomDisplay() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                SkipButton(),
                GoogleButton(auth),
              ],
            ),
            PolicyText(),
          ],
        ),
      ),
    );
  }
}
