import 'package:final_comic_reader/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 3, color: Colors.grey.shade400),
        ),
        child: ElevatedButton(
          onPressed: () {
            // const snackBar = SnackBar(content: Text('Logged in successfully.'));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return HomeScreen();
                },
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/icons/facebook-icon.png',
              //   height: 25,
              // ),
              Icon(
                Icons.skip_next,
                color: Colors.indigo.shade900,
              ),
              Text(
                ' SKIP',
                style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
