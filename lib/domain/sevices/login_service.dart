import 'package:arqutitetura_smart/domain/entities/entities.dart';

abstract class LoginService {
  Future<Login> realizeLogin({required String usuario, required String senha});
}
