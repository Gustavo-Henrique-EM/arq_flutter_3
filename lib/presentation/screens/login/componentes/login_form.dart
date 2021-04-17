import 'package:arqutitetura_smart/presentation/bloc/login/login_bloc.dart';
import 'package:arqutitetura_smart/presentation/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usuarioController = new TextEditingController();
  final _senhaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBloc>(context);
    Widget widget;
    if (loginBloc.state.isCarregando) {
      widget = CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        strokeWidth: 1,
      );
    } else {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              'Login',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _usuarioController,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(1),
                labelText: "Email or Username",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                suffixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _senhaController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(1),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                suffixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              width: double.infinity,
              color: Colors.white,
              // ignore: deprecated_member_use
              child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: widget,
                  //child: widget,
                  onPressed: () => onLoginButtonPressed(
                      senha: _senhaController.text,
                      login: _usuarioController.text,
                      context: context)),
            ),
          ],
        ),
      ),
    );
  }
}
