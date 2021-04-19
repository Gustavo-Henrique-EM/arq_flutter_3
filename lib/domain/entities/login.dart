import 'package:arqutitetura_smart/domain/entities/usuario.dart';
import 'package:meta/meta.dart';

class Login {
  final Usuario usuario;
  final String token;

  Login({
    required this.usuario,
    required this.token,
  });
}
