import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/config/router/app_router.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/services/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  await _initializeNotifications();
  runApp(ProviderScope(child: MyApp()));
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> zonedScheduleNotification({
//     required int id,
//     required String title,
//     String? body,
//     required int hour,
//     required int minute,
//   }) async {
//     final TZDateTime now = TZDateTime.now(tz.local);
//     TZDateTime scheduledDate = TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       hour,
//       minute,
//     );
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledDate,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your channel id',
//           'your channel name',
//           channelDescription: 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
//       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   Future<void> scheduleWeeklyNotification({
//     required int id,
//     required String title,
//     String? body,
//     required int weekday, // 1 = lunes, 4 = jueves
//     required int hour,
//     required int minute,
//   }) async {
//     final now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       hour,
//       minute,
//     );

//     while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledDate,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your channel id',
//           'your channel name',
//           channelDescription: 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
//       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   @override
//   void initState() {
//     init();
//     super.initState();
//     zonedScheduleNotification(
//       id: 0,
//       title: '¿Estás libre?',
//       body: '¡Es hora de revisar tus actividades!',
//       hour: 15,
//       minute: 40,
//     );
//     scheduleWeeklyNotification(
//       id: 1,
//       title: 'Alarma de Martes',
//       body: '¡Hola perro!',
//       weekday: DateTime.tuesday,
//       hour: 21,
//       minute: 34,
//     );
//   }

//   Future<void> init() async {
//     tz.initializeTimeZones();

//     // Zona: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
//     setLocalLocation(getLocation('America/Monterrey'));

//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings();

//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: androidSettings, iOS: iosSettings);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         // Manejar la respuesta de la notificación aquí
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'P.A.S.H.',
//       routerConfig: appRouter,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Color(0xFF1e88e5),
//           primary: Color(0xFF1e88e5),
//         ),
//         useMaterial3: true,
//       ),
//     );
//   }
// }


Future<void> _initializeNotifications() async {
  // Configurar zonas horarias
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Mexico_City')); // Zona horaria correcta para CDMX

  // Inicializar servicio de notificaciones
  final notificationService = NotificationService();
  await notificationService.initialize();

  // Configurar notificaciones por defecto (opcional)
  await notificationService.setupDefaultNotifications();
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