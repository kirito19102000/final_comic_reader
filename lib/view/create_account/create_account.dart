import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/create_account/components/create_account_app_bar.dart';
import 'package:final_comic_reader/view/create_account/components/sign_up_button.dart';
import 'package:final_comic_reader/view/create_account/components/sign_up_input_field.dart';
import 'package:final_comic_reader/view/login_screen/components/input_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAccountScreenState();
  }

}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final createAccountKey = GlobalKey<FormState>();
  final namelController = TextEditingController();
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
      appBar: const CreateAccountAppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Form(
              key: createAccountKey,
              child: SignUpInputField(namelController, emailController, passwordController),
            ),
            // Text(loginMessage),
            // Container(margin: const EdgeInsets.only(top: 10)),
            SignUpButton(auth, namelController, emailController, passwordController),
            Container(margin: const EdgeInsets.only(top: 10)),
          ],
        ),
      ),
    );
  }
}