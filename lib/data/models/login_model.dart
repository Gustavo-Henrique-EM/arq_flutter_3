import 'package:arqutitetura_smart/data/models/models.dart';
import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:meta/meta.dart';

class LoginModel {
  final UsuarioModel usuario;
  final String token;

  LoginModel({
    required this.usuario,
    required this.token,
  });
}
