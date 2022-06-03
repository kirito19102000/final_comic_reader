import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/home_screen/home_screen.dart';
import 'package:final_comic_reader/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  final FirebaseAuthentication auth;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton(this.auth, this.nameController, this.emailController, this.passwordController,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpButtonState();
  }
}

class SignUpButtonState extends State<SignUpButton> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          style: TextStyle(
              color: message != '' ? Colors.red : Colors.green),
        ),
        Container(padding: const EdgeInsets.all(5)),
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(bottom: 2),
          child: ElevatedButton(
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF1CB0F6),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: signUpPressed,
          ),
        ),
      ],
    );
  }

  signUpPressed() {
    String name = widget.nameController.text;
    String email = widget.emailController.text;
    String password = widget.passwordController.text;
    widget.auth.createUser(name, email, password).then((value) {
      print('Received signed up Account: ${name} -  ${email} - ${password}');
      if (value == null) {
        setState(() {
          print('Sign up failed');
          message = 'Fail to create new account';
        });
      } else {
        setState(() {
          print('Sign up good');
          message = '';
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        });
      }
    });
  }
}
