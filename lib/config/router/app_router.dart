import 'package:go_router/go_router.dart';
import 'package:isar_app/config/onboarding/onboarbing_config.dart';
import 'package:isar_app/features/presentation/screens/actividades_screen.dart';
import 'package:isar_app/features/presentation/screens/home_screen.dart';
import 'package:isar_app/features/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:isar_app/features/presentation/screens/profile_screen.dart';
import 'package:isar_app/features/presentation/widgets/custom_bottom_navigation.dart';
final appRouter = GoRouter(initialLocation: '/onboarding', routes: [

  GoRoute(
      path: '/onboarding',
      builder: (context, state) => SplashPage(),
    ),

    GoRoute(
      path: '/onboarding-screen',
      builder: (context, state) => OnBoardingScreen(),
    ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, StatefulNavigationShell navidationShell) {
      return CustomBottomNavigation(navigationShell: navidationShell,);
    },
    branches: [
      
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
        )
      ]),
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
          path: '/semanas',
          builder: (context, state) => ActividadesScreen(),
        )
      ]),
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
          path: '/profile',
          builder: (context, state) => ProfileScreen(),
        )
      ]),
    ],
  )

]);
