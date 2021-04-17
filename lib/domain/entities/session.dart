import 'package:arqutitetura_smart/domain/entities/usuario.dart';
import 'package:meta/meta.dart';

class Session {
  final Usuario user;
  final String tokenUsuario;

  Session({
    @required this.tokenUsuario,
    @required this.user,
  })  : assert(tokenUsuario != null),
        assert(user != null);

  Session altereToken(String token) {
    return Session(
      tokenUsuario: token,
      user: this.user,
    );
  }
}
