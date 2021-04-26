import 'dart:async';
import 'package:arqutitetura_smart/domain/usecases/login_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginState.loading();

      var result = await loginUseCase.realizeLogin(
          usuario: event.login, senha: event.senha);
      yield result.fold(
        (failure) => LoginState.failure(failure.message),
        (success) => LoginState.success(success),
      );
    }
  }
}
