import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/pages/login_user.dart';
import 'package:flutter_project_async_api/services/firebase/auth/firebase_auth_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final Color colorAppBar;
  final Color colorText;

  CustomAppBar({super.key, required this.titleAppBar, required this.colorAppBar, required this.colorText});
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(titleAppBar, style: TextStyle(color: colorText),),
      backgroundColor: colorAppBar,
      actions: [
        IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginUser()));
            },
            icon: const Icon(Icons.logout), color: Colors.white,)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
