import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:arqutitetura_smart/domain/erros/errors.dart';
import 'package:arqutitetura_smart/domain/repositories/repositories.dart';
import 'package:arqutitetura_smart/domain/sevices/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LoginUseCase {
  final LoginService loginService;
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginService, required this.loginRepository});

  Future<Either<Failure, Login>> realizeLogin(
      {required String usuario, required String senha}) async {
    if (usuario.isEmpty || senha.isEmpty) {
      //throw Exception("Teste vazio");
      return Left(ErrorLogin(message: "Informe login e a senha"));
    }
    if (senha.length < 6) {
      return Left(ErrorLogin(message: "Senha deve conter no mínimo 6 dígitos"));
    }

    if (senha.length > 30) {
      return Left(
          ErrorLogin(message: "Senha deve conter no máximo 30 dígitos"));
    }

    try {
      var login =
          await loginService.realizeLogin(usuario: usuario, senha: senha);

      if (login == null) {
        return Left(ErrorLogin(message: "Valor nulo"));
      }
      //loginRepository.Grave(loginModel.user);
      return Right(login);
    } catch (error, stackTrace) {
      await Sentry.captureException(error,
          stackTrace: stackTrace, hint: "usuario: ${"155653"}");
      return Left(InternalError(message: error.toString()));
    }
  }
}
