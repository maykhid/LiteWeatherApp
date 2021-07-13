import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget? body;

  const BaseView({
    Key? key,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: body!),
    );
  }
}
