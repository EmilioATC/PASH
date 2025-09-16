import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/config/router/app_router.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/services/home_widget_service.dart';
import 'package:isar_app/services/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  await _initializeNotifications();
  await HomeWidgetService.updateWidgetData();
  runApp(ProviderScope(child: MyApp()));
}

Future<void> _initializeNotifications() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Mexico_City'));

  final notificationService = NotificationService();
  await notificationService.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'P.A.S.H.',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1e88e5),
          primary: const Color(0xFF1e88e5),
        ),
        useMaterial3: true,
      ),
    );
  }
}