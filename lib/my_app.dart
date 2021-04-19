import 'package:arqutitetura_smart/presentation/bloc/application/application_bloc.dart';
import 'package:arqutitetura_smart/presentation/bloc/application/application_event.dart';
import 'package:arqutitetura_smart/presentation/bloc/application/application_state.dart';
import 'package:arqutitetura_smart/presentation/screens/home/hom_screen.dart';
import 'package:arqutitetura_smart/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApplicationBloc _appBloc;
  @override
  void initState() {
    super.initState();
    _appBloc = ApplicationBloc(ApplicationState.initializing());
    _appBloc.add(ApplicationStartEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
            create: (BuildContext context) => _appBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Arquitetura Smart",
        home: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state.isInitializing) {
              return LoginScreen();
            }

            if (!state.isAuthenticated) {
              return LoginScreen();
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
