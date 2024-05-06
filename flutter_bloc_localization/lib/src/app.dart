import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/l10n.dart';
import 'routes/router.dart' as app_router;
import 'home_ex.dart';
import 'theme/app_theme.dart';

//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _appRouter = app_router.Router();

  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;
    return BlocProvider(
      create: (context) => LocalizationBloc()..add(GetLanguage()),
      child: BlocBuilder<LocalizationBloc, AppLocalizationState>(
        buildWhen: (previous, current) =>
            previous.selectedLanguage != current.selectedLanguage,
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppTheme.light(),
            locale: state.selectedLanguage.value,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
