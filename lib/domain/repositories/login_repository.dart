import 'package:arqutitetura_smart/data/models/models.dart';

abstract class LoginRepository {
  Future<void> grave(UsuarioModel userModel);
}
