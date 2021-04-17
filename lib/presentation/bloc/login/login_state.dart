import 'package:arqutitetura_smart/domain/entities/login.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginState extends Equatable {
  final bool isInicializando;
  final bool isCarregando;
  final bool isSucesso;
  final bool isErro;
  final String error;
  final Login login;

  LoginState({
    @required this.isInicializando,
    @required this.isCarregando,
    @required this.isSucesso,
    @required this.isErro,
    @required this.error,
    @required this.login,
  });

  factory LoginState.initial() {
    return LoginState(
      isInicializando: true,
      isCarregando: false,
      isSucesso: false,
      isErro: false,
      error: null,
      login: null,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isInicializando: false,
      isCarregando: true,
      isSucesso: false,
      isErro: false,
      error: null,
      login: null,
    );
  }

  factory LoginState.failure(String error) {
    return LoginState(
      isInicializando: false,
      isCarregando: false,
      isSucesso: false,
      isErro: true,
      error: error,
      login: null,
    );
  }

  factory LoginState.success(Login login) {
    return LoginState(
      isInicializando: false,
      isCarregando: false,
      isSucesso: true,
      isErro: false,
      error: null,
      login: login,
    );
  }

  @override
  List<Object> get props =>
      [isInicializando, isCarregando, isSucesso, isErro, error];
}
