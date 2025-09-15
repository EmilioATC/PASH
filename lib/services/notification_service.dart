import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  static const int _dailyReminderId = 1000;
  static const int _weeklyStartId = 2000;
  static const int _weeklyEndId = 3000;
  static const int _activityReminderId = 4000;

  Future<void> initialize() async {
    if (_isInitialized) return;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(android: android, iOS: ios);

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Manejar la respuesta de la notificación aquí
      },
    );

    _isInitialized = true;
  }

  Future<void> scheduleDailyReminder({
    int hour = 19,
    int minute = 24,
    String? title,
    String? customMessage,
  }) async {
    await _notifications.zonedSchedule(
      _dailyReminderId,
      title ?? '¡Recordatorio Diario! 📆',
      customMessage ?? '¡Es hora de revisar tus actividades del día!',
      _nextInstanceOfTime(hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          'Recordatorios Diarios',
          channelDescription: 'Recordatorio diario para revisar actividades',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'daily_reminder'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'daily_reminder',
    );
  }

  Future<void> scheduleWeeklyStartReminder({
    int weekday = DateTime.monday,
    int hour = 9,
    int minute = 0,
  }) async {
    await _notifications.zonedSchedule(
      _weeklyStartId,
      '¡Nueva semana! 🚀',
      '¡Es momento de planificar tu semana y definir tus metas!',
      _nextInstanceOfWeekday(weekday, hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'weekly_start',
          'Inicio de Semana',
          channelDescription: 'Recordatorio de inicio de semana',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'weekly_start'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: 'weekly_start',
    );
  }

  Future<void> scheduleWeeklyEndReminder({
    int weekday = DateTime.sunday,
    int hour = 21,
    int minute = 0,
  }) async {
    await _notifications.zonedSchedule(
      _weeklyEndId,
      '¡Fin de semana! 📊',
      '¡Revisa tu progreso semanal y celebra tus logros!',
      _nextInstanceOfWeekday(weekday, hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'weekly_end',
          'Fin de Semana',
          channelDescription: 'Recordatorio de fin de semana',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'weekly_end'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: 'weekly_end',
    );
  }

  Future<void> scheduleActivityReminder({
    required int activityId,
    required String activityName,
    required DateTime scheduledTime,
    String? customMessage,
  }) async {
    final id = _activityReminderId + activityId;

    await _notifications.zonedSchedule(
      id,
      '⏰ Recordatorio: $activityName',
      customMessage ?? '¡Es hora de trabajar en "$activityName"!',
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'activity_reminder',
          'Recordatorios de Actividades',
          channelDescription: 'Recordatorios para actividades específicas',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'activity_reminder'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'activity_$activityId',
    );
  }

  // Notificación de motivación cuando se complete una actividad
  Future<void> showCompletionNotification({
    required String activityName,
    required int pointsEarned,
  }) async {
    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      '🎉 ¡Actividad completada!',
      '¡Has completado "$activityName" y ganado $pointsEarned puntos!',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'completion',
          'Actividades Completadas',
          channelDescription: 'Notificaciones cuando completas actividades',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'completion'),
      ),
      payload: 'completion',
    );
  }

  // Notificación de progreso semanal
  Future<void> showWeeklyProgress({
    required int completedActivities,
    required int totalActivities,
    required int totalPoints,
  }) async {
    final percentage = totalActivities > 0
        ? ((completedActivities / totalActivities) * 100).round()
        : 0;

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      '📈 Progreso Semanal',
      '¡Has completado $completedActivities/$totalActivities actividades ($percentage%)! Total: $totalPoints puntos.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'weekly_progress',
          'Progreso Semanal',
          channelDescription: 'Resumen del progreso semanal',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'weekly_progress'),
      ),
      payload: 'weekly_progress',
    );
  }

  // Cancelar todas las notificaciones programadas
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  // Cancelar notificación específica
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  // Cancelar recordatorio de actividad específica
  Future<void> cancelActivityReminder(int activityId) async {
    await _notifications.cancel(_activityReminderId + activityId);
  }

  // Verificar permisos
  Future<bool> areNotificationsEnabled() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      return await android.areNotificationsEnabled() ?? false;
    }
    return true; // Asumir que están habilitadas en iOS
  }

  // Obtener notificaciones programadas pendientes (para debugging)
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    try {
      final pending = await _notifications.pendingNotificationRequests();
      return pending;
    } catch (e) {
      return [];
    }
  }

  // Verificar si una notificación específica está programada
  Future<bool> isNotificationScheduled(int id) async {
    try {
      final pending = await _notifications.pendingNotificationRequests();
      return pending.any((notification) => notification.id == id);
    } catch (e) {
      return false;
    }
  }

  // Actualizar notificación de actividad (útil cuando cambian los settings)
  Future<void> updateActivityNotification(Actividad actividad) async {
    try {
      // Cancelar notificación anterior
      if (actividad.idNotificacionProgramada != null) {
        await cancelNotification(actividad.idNotificacionProgramada!);
        actividad.idNotificacionProgramada = null;
      }

      // Programar nueva notificación si está habilitada
      if (actividad.notificacionesHabilitadas) {
        await scheduleActivityNotification(actividad);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Cancelar notificación de actividad específica
  Future<void> cancelActivityNotification(Actividad actividad) async {
    try {
      if (actividad.idNotificacionProgramada != null) {
        await cancelNotification(actividad.idNotificacionProgramada!);
        actividad.idNotificacionProgramada = null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> scheduleRecurringActivityNotification(
    Actividad actividad,
  ) async {
    try {
      if (!actividad.notificacionesHabilitadas) return;

      switch (actividad.frecuenciaNotificacion) {
        case FrecuenciaNotificacion.unica:
          await scheduleActivityNotification(actividad);
          break;

        case FrecuenciaNotificacion.diaria:
          await _scheduleDailyActivityNotification(actividad);
          break;

        case FrecuenciaNotificacion.semanal:
          await _scheduleWeeklyActivityNotification(actividad);
          break;

        case FrecuenciaNotificacion.personalizada:
          await _scheduleCustomActivityNotification(actividad);
          break;
      }
    } catch (e) {
      rethrow;
    }
  }

  int _generateActivityNotificationId(int activityId) {
    return 5000 + activityId;
  }

  Future<void> scheduleActivityNotification(Actividad actividad) async {
    try {
      if (!actividad.notificacionesHabilitadas) {
        return;
      }

      if (actividad.idNotificacionProgramada != null) {
        await cancelNotification(actividad.idNotificacionProgramada!);
      }

      final scheduledTime = actividad.getProximaFechaNotificacion();
      if (scheduledTime == null) {
        return;
      }

      final notificationId = _generateActivityNotificationId(actividad.id);
      actividad.idNotificacionProgramada = notificationId;

      await _notifications.zonedSchedule(
        notificationId,
        '⏰ Actividad: ${actividad.nombre}',
        actividad.getMensajeNotificacion(),
        tz.TZDateTime.from(scheduledTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'activity_reminder',
            'Recordatorios de Actividades',
            channelDescription: 'Recordatorios para actividades específicas',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            categoryIdentifier: 'activity_reminder',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'activity_${actividad.id}',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _scheduleDailyActivityNotification(Actividad actividad) async {
    if (actividad.horaNotificacionDiaria == null) return;

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      actividad.horaNotificacionDiaria!.hour,
      actividad.horaNotificacionDiaria!.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    final notificationId = _generateActivityNotificationId(actividad.id);

    await _notifications.zonedSchedule(
      notificationId,
      '⏰ Actividad Diaria: ${actividad.nombre}',
      actividad.getMensajeNotificacion(),
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'activity_reminder',
          'Recordatorios de Actividades',
          channelDescription: 'Recordatorios para actividades específicas',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'activity_reminder'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'activity_${actividad.id}',
    );

    actividad.idNotificacionProgramada = notificationId;
  }

  Future<void> _scheduleWeeklyActivityNotification(Actividad actividad) async {
    if (actividad.diaSemanaNotificacion == null ||
        actividad.horaNotificacionSemanal == null) {
      return;
    }
    final scheduledTime = _nextInstanceOfWeekday(
      actividad.diaSemanaNotificacion!,
      actividad.horaNotificacionSemanal!.hour,
      actividad.horaNotificacionSemanal!.minute,
    );

    final notificationId = _generateActivityNotificationId(actividad.id);

    await _notifications.zonedSchedule(
      notificationId,
      '⏰ Actividad Semanal: ${actividad.nombre}',
      actividad.getMensajeNotificacion(),
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'activity_reminder',
          'Recordatorios de Actividades',
          channelDescription: 'Recordatorios para actividades específicas',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'activity_reminder'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: 'activity_${actividad.id}',
    );

    actividad.idNotificacionProgramada = notificationId;
  }

  Future<void> _scheduleCustomActivityNotification(Actividad actividad) async {
    if (actividad.diasNotificacionPersonalizada.isEmpty ||
        actividad.horaNotificacionPersonalizada == null) {
      return;
    }

    final scheduledTime = _proximaFechaDiasPersonalizados(
      actividad.diasNotificacionPersonalizada,
      actividad.horaNotificacionPersonalizada!.hour,
      actividad.horaNotificacionPersonalizada!.minute,
    );

    final notificationId = _generateActivityNotificationId(actividad.id);

    await _notifications.zonedSchedule(
      notificationId,
      '⏰ Actividad: ${actividad.nombre}',
      actividad.getMensajeNotificacion(),
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'activity_reminder',
          'Recordatorios de Actividades',
          channelDescription: 'Recordatorios para actividades específicas',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'activity_reminder'),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'activity_${actividad.id}',
    );

    actividad.idNotificacionProgramada = notificationId;
  }

  tz.TZDateTime _proximaFechaDiasPersonalizados(
    List<int> dias,
    int hour,
    int minute,
  ) {
    final now = tz.TZDateTime.now(tz.local);
    final diaActual = now.weekday;

    for (int dia in dias) {
      if (dia >= diaActual) {
        final fecha = now.add(Duration(days: dia - diaActual));
        final fechaHora = tz.TZDateTime(
          tz.local,
          fecha.year,
          fecha.month,
          fecha.day,
          hour,
          minute,
        );
        if (fechaHora.isAfter(now)) {
          return fechaHora;
        }
      }
    }

    final primerDia = dias.first;
    final fecha = now.add(Duration(days: 7 - diaActual + primerDia));
    return tz.TZDateTime(
      tz.local,
      fecha.year,
      fecha.month,
      fecha.day,
      hour,
      minute,
    );
  }

  Future<bool> isActivityNotificationScheduled(Actividad actividad) async {
    if (actividad.idNotificacionProgramada == null) return false;

    try {
      final pending = await _notifications.pendingNotificationRequests();
      return pending.any(
        (notification) => notification.id == actividad.idNotificacionProgramada,
      );
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> validateActivityNotifications(
    List<Actividad> actividades,
  ) async {
    final issues = <String>[];

    for (final actividad in actividades) {
      if (actividad.notificacionesHabilitadas) {
        // Verificar que tenga configuración válida según la frecuencia
        switch (actividad.frecuenciaNotificacion) {
          case FrecuenciaNotificacion.unica:
            if (actividad.fechaNotificacion == null) {
              issues.add(
                '${actividad.nombre}: Falta fecha para notificación única',
              );
            }
            if (actividad.horaNotificacion == null) {
              issues.add(
                '${actividad.nombre}: Falta hora para notificación única',
              );
            }
            break;

          case FrecuenciaNotificacion.diaria:
            if (actividad.horaNotificacionDiaria == null) {
              issues.add(
                '${actividad.nombre}: Falta hora para notificación diaria',
              );
            }
            break;

          case FrecuenciaNotificacion.semanal:
            if (actividad.diaSemanaNotificacion == null) {
              issues.add(
                '${actividad.nombre}: Falta día de la semana para notificación semanal',
              );
            }
            if (actividad.horaNotificacionSemanal == null) {
              issues.add(
                '${actividad.nombre}: Falta hora para notificación semanal',
              );
            }
            break;

          case FrecuenciaNotificacion.personalizada:
            if (actividad.diasNotificacionPersonalizada.isEmpty) {
              issues.add(
                '${actividad.nombre}: No hay días seleccionados para notificación personalizada',
              );
            }
            if (actividad.horaNotificacionPersonalizada == null) {
              issues.add(
                '${actividad.nombre}: Falta hora para notificación personalizada',
              );
            }
            break;
        }

        // Verificar que la próxima fecha sea válida
        final proximaFecha = actividad.getProximaFechaNotificacion();
        if (proximaFecha == null) {
          issues.add(
            '${actividad.nombre}: No se puede calcular próxima fecha de notificación',
          );
        } else if (proximaFecha.isBefore(DateTime.now())) {
          issues.add(
            '${actividad.nombre}: La próxima notificación está en el pasado',
          );
        }

        // Verificar que la notificación esté realmente programada
        final isScheduled = await isActivityNotificationScheduled(actividad);
        if (!isScheduled && actividad.idNotificacionProgramada != null) {
          issues.add(
            '${actividad.nombre}: Notificación programada pero no encontrada en el sistema',
          );
        }
      }
    }

    return issues;
  }

  // Solicitar permisos
  Future<bool> requestPermissions() async {
    final android = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? false;
    }

    final ios = _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      return await ios.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }

    return false;
  }

  // Funciones auxiliares para calcular tiempos
  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfWeekday(int weekday, int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  // Configurar todas las notificaciones por defecto
  Future<void> setupDefaultNotifications() async {
    await initialize();

    // Recordatorio diario a las 9:00 AM
    await scheduleDailyReminder(hour: 9, minute: 0);

    // Recordatorio de inicio de semana (lunes 8:00 AM)
    await scheduleWeeklyStartReminder(
      weekday: DateTime.monday,
      hour: 8,
      minute: 0,
    );

    // Recordatorio de fin de semana (domingo 8:00 PM)
    await scheduleWeeklyEndReminder(
      weekday: DateTime.sunday,
      hour: 20,
      minute: 0,
    );
  }
}