import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:arqutitetura_smart/domain/sevices/services.dart';
import 'package:arqutitetura_smart/data/models/models.dart';
import 'package:arqutitetura_smart/data/metodo_extensao_converta.dart';

class LoginServiceImpl implements LoginService {
  @override
  Future<Login> realizeLogin({String usuario, String senha}) async {
    if (usuario == "gustavo" && senha == "123456") {
      var loginModel = LoginModel(
          usuario: UsuarioModel(nome: "Gustavo", id: 1), token: "asasasad");

      return loginModel.converta;
    }

    throw Exception("Login ou senha inválido");
  }
}
