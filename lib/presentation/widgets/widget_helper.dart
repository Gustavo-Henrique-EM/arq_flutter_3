import 'package:flutter/material.dart';

class WidgetHelper {
  static AppBar appBar(String texto, List<Widget> actions) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          texto,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  static void showError(BuildContext context, String errorMessage) {
    _onWidgetDidBuild(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    });
  }

  static void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
