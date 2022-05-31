import 'package:flutter/material.dart';

class CreateAccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateAccountAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(
        'Create your account',
        style:
            TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.grey.shade600,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
