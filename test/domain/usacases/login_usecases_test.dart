import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:arqutitetura_smart/domain/repositories/repositories.dart';
import 'package:arqutitetura_smart/domain/sevices/services.dart';
import 'package:arqutitetura_smart/domain/usecases/login_usecases.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class LoginRepositoryMock extends Mock implements LoginRepository {}

class LoginServiceMock extends Mock implements LoginService {}

void main() {

  LoginRepositoryMock repository;
  LoginServiceMock service;
  LoginUseCase usecase;

  setUp(() {
    repository = LoginRepositoryMock();
    service = LoginServiceMock();
    usecase = LoginUseCase(loginService: service, loginRepository: repository);
  });

  test('Login inválido', () async {
    var result = await usecase.realizeLogin(usuario: "", senha: "");
    expect(result.isLeft(), true);
  });

  final usuario = "gustavo";
  final senha = "123456";
  final login = Login(usuario: Usuario(nome: "Gustavo", id: 1), token: "asasasad");

  test('Login válido', () async {
    // arrange
    when(service.realizeLogin(usuario: usuario, senha: senha)).thenAnswer((_) async => login);
    // act
    final result = await usecase.realizeLogin(usuario: usuario, senha: senha);
    // assert
    expect(result.isRight(), true);
  });
}