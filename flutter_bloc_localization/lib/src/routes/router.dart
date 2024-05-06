import 'package:flutter/material.dart';
import 'package:flutter_bloc_localization/src/routes/routes_name.dart';
import 'package:go_router/go_router.dart';

import '../home_ex.dart';

class Router {
  Router();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.onboardingPath,
    routes: [
      GoRoute(
        name: Routes.onboarding,
        path: Routes.onboardingPath,
        builder: (context, state) {
          final bool? animateTop = state.extra as bool?;
          return Banner(
            message: 'FlexZ',
            location: BannerLocation.bottomStart,
            child: HomeScreen(
              animateTop: animateTop ?? true,
            ),
          );
        },
      ),
    ],
  );
}
