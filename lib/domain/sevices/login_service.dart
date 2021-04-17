import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:arqutitetura_smart/data/models/models.dart';

abstract class LoginService {
  Future<Login> realizeLogin({String usuario, String senha});
}
