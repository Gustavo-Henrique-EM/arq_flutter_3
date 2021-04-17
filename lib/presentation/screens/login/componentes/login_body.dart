import 'package:flutter/material.dart';

import '../login.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: ListView(
        children: <Widget>[
          LoginLogo(),
          LoginForm(),
        ],
      ),
    );
  }
}
