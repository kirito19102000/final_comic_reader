import 'package:final_comic_reader/view/create_account/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateAccountScreen(),
          ),
        );
      },
      child: const Text(
        'CREATE ACCOUNT',
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1CB0F6)),
        softWrap: true,
      ),
    );
  }
}
