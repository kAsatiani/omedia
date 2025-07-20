import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omedia/src/bloc/obligations_bloc.dart';
import 'package:omedia/src/data/data_source/obligations_datasource.dart';
import 'package:omedia/src/data/repositories/obligtations_repository.dart';
import 'package:omedia/src/ui/app_view.dart';
import 'package:ui_kit/themes/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ObligationsBloc(
        repository: ObligationsRepositoryImplementation(
          dataSource: ObligationsDataSourceImplementation(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppView(),

        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          fontFamily: 'HelveticaNeue',
          textTheme: TextStyles.textTheme,
          useMaterial3: true,
        ),
      ),
    );
  }
}
