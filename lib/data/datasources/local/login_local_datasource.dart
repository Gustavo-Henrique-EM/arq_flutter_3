import 'package:arqutitetura_smart/data/models/models.dart';

abstract class LoginLocalDatasource {
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> insertLogins(List<LoginModel> articles);
  Future<bool> deleteAllLogins();
  Future<List<LoginModel>> getLogins();
}
