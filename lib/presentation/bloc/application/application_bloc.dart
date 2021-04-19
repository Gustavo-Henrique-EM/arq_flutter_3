import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test/test.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc(ApplicationState initialState) : super(initialState);

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartEvent) {
      String token = ""; //await TokenRepository().getToken();
      if (token.isEmpty) {
        yield ApplicationState.unauthenticated();
      } else {
        yield* _inicializeAplicacao(token);
      }

      return;
    }

    if (event is ApplicationLoginEvent) {
      //TokenRepository().persistToken(event.token);
      yield* _inicializeAplicacao(event.token);
      return;
    }

//    if (event is ApplicationLogoutEvent) {
//      if (await TokenRepository().hasDeviceToken()) {
//        TokenService().desregistreToken(
//          session: state.session,
//          tokenDispositivo: await TokenRepository().getDeviceToken(),
//        );
//      }
//
//      TokenRepository().deleteTokens();
//      UtilidadesRepository().deleteAllFilesInCache();
//      UserRepository().limpeCache();
//      yield ApplicationState.unauthenticated();
//      return;
//    }
  }

  Stream<ApplicationState> _inicializeAplicacao(String token) async* {
//    var session = Session(
//      tokenUsuario: token,
//      user: User(nome: "Gustavo Henrique", id: 1),
//    );
    ApplicationState.unauthenticated();

//    try {
//      await _carregueDados(session);
//    } catch (error, stackTrace) {
//      yield ApplicationState.unauthenticated();
//      if (!ehErroDeTimeoutNaConexao(error)) {
//        reportError(error, stackTrace);
//        return;
//      }
//    }

    yield ApplicationState.authenticated();
    return;
  }

//  Future _carregueDados(SessionModel session) async {
//    var docentes = await DocenteService().obtenhaDocentes();
//  }
}
