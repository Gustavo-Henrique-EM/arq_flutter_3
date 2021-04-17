import 'package:arqutitetura_smart/injector.dart';
import 'package:arqutitetura_smart/presentation/bloc/application/application_bloc.dart';
import 'package:arqutitetura_smart/presentation/bloc/application/application_event.dart';
import 'package:arqutitetura_smart/presentation/bloc/bloc.dart';
import 'package:arqutitetura_smart/presentation/bloc/login/login_bloc.dart';
import 'package:arqutitetura_smart/presentation/bloc/login/login_state.dart';
import 'package:arqutitetura_smart/presentation/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {

            if (state.isSucesso) {
              BlocProvider.of<ApplicationBloc>(context).add(
                ApplicationLoginEvent(
                  token: state.login.token,
                ),
              );
            } if (state.isErro) {
              WidgetHelper.showError(_scaffoldKey, state.error);
            }

            return LoginBody();
          },
        ),
      ),
    );
  }
}

void onLoginButtonPressed({String senha, String login, BuildContext context}) {
  BlocProvider.of<LoginBloc>(context).add(LoginButtonPressedEvent(
    senha: senha,
    login: login,
  ));
}


