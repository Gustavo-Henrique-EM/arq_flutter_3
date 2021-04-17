import 'package:arqutitetura_smart/domain/repositories/repositories.dart';
import 'package:arqutitetura_smart/domain/sevices/services.dart';
import 'package:arqutitetura_smart/domain/usecases/usescases.dart';
import 'package:arqutitetura_smart/data/repositories/repositories.dart';
import 'package:arqutitetura_smart/data/services/services.dart';
import 'package:arqutitetura_smart/presentation/bloc/bloc.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt()));

  getIt.registerFactory(
      () => LoginUseCase(loginRepository: getIt(), loginService: getIt()));

  getIt.registerFactory<LoginRepository>(() => LoginRepositoryImpl());
  getIt.registerFactory<LoginService>(() => LoginServiceImpl());
}
