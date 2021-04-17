import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:arqutitetura_smart/domain/erros/errors.dart';
import 'package:arqutitetura_smart/domain/repositories/repositories.dart';
import 'package:arqutitetura_smart/domain/sevices/services.dart';

class LoginUseCase {
  final LoginService loginService;
  final LoginRepository loginRepository;

  LoginUseCase({this.loginService, this.loginRepository});

  Future<Either<Failure, Login>> realizeLogin(
      {String usuario, String senha}) async {
    if (usuario.isEmpty || senha.isEmpty) {
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
    } catch (e) {
      return Left(InternalError(message: e.toString()));
    }
  }
}
