import 'package:final_comic_reader/shared/firebase_authentication.dart';
import 'package:final_comic_reader/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final FirebaseAuthentication auth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(this.auth, this.emailController, this.passwordController,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginButtonState();
  }
}

class LoginButtonState extends State<LoginButton> {
  String loginMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          loginMessage,
          style: TextStyle(
              color: loginMessage == 'Login Error' ? Colors.red : Colors.green),
        ),
        Container(padding: const EdgeInsets.all(5)),
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(bottom: 2),
          child: ElevatedButton(
            child: const Text(
              'LOG IN',
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
            onPressed: loginPressed,
          ),
        ),
      ],
    );
  }

  loginPressed() {
    String userId = '';
    String email = widget.emailController.text;
    String password = widget.passwordController.text;
    widget.auth.login(email, password).then((value) {
      print('Received Account: ${email} - ${password}');
      if (value == null) {
        setState(() {
          print('Login failed');
          loginMessage = 'Login Error';
        });
      } else {
        userId = value;
        setState(() {
          print('login successfully');
          loginMessage = 'User $userId successfully logged in';
          // SnackBar snackBar =
          //     SnackBar(content: Text('Logged in successfully.'));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // WidgetsBinding.instance?.addPostFrameCallback((_) {
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                message: 'Logged in successfully.',
              ),
            ),
          );
        });
      }
    });
  }
}

////// create user
// else {
// auth.createUser(txtUserName.text, txtPassword.text).then((value) {
// if (value == null) {
// setState(() {
// _message = 'Registration Error';
// });
// } else {
// userId = value;
// setState(() {
// _message = 'User $userId successfully signed in';
// });
// }
// });
// };
