import 'package:flutter/material.dart';

class SignUpInputField extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpInputField(this.emailController, this.passwordController, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpInputFieldState();
  }
}

class SignUpInputFieldState extends State<SignUpInputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          accountField(),
          passwordField(),
        ],
      ),
    );
  }

  accountField() {
    return TextFormField(
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        hintText: 'Enter email',
      ),
      // validator: validateEmail,
      onChanged: (value) {
        // bloc.changeEmail(value);
      },
    );
  }

  passwordField() {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF1CB0F6),
          ),
          onPressed: () {
            isObscure = !isObscure;
            setState(() {});
          },
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
        hintText: 'Enter Password',
      ),
      // validator: validatePassword,
    );
  }
}