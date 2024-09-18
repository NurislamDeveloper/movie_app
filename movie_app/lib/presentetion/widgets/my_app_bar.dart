import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        'assets/netflix.png',
        fit: BoxFit.cover,
        height: 80,
        filterQuality: FilterQuality.high,
      ),
      centerTitle: true,
    );
  }
}
