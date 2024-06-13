import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final Color colorAppBar;

  const CustomAppBar({super.key, required this.titleAppBar, required this.colorAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleAppBar),
      backgroundColor: colorAppBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
