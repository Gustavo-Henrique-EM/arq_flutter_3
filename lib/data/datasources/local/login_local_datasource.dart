import 'package:arqutitetura_smart/data/models/login_model.dart';

abstract class LoginLocalDatasource {
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> insertLogins(List<LoginModel> articles);
  Future<bool> deleteAllLogins();
  Future<List<LoginModel>> getLogins();
}
