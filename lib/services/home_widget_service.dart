import 'dart:convert';
import 'package:home_widget/home_widget.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/services/notification_service.dart';

class HomeWidgetService {
  static const String _appGroupId = 'com.example.isar_app';
  static const String _widgetDataKey = 'widgetData';

  static Future<void> initialize() async {
    await HomeWidget.setAppGroupId(_appGroupId);
    await updateWidgetData();
    HomeWidget.widgetClicked.listen(_handleWidgetClick);
  }

  static Future<void> updateWidgetData() async {
    try {
      final isarService = IsarService();
      final resumen = await isarService.obtenerResumenSemanal();

      if (resumen != null) {
        final jsonData = jsonEncode(resumen);
        await HomeWidget.saveWidgetData<String>(_widgetDataKey, jsonData);

        await HomeWidget.updateWidget(
          name: 'WeeklyProgressWidget',
          androidName: 'WeeklyProgressWidget',
        );
      } else {
        await _updateWidgetWithEmptyState();
      }
    } catch (e) {
      await _updateWidgetWithErrorState();
    }
  }

  static Future<void> _updateWidgetWithEmptyState() async {
    final emptyData = jsonEncode({
      'estado': 'vacio',
      'mensaje': 'No hay actividades disponibles',
      'progresoTotal': 0,
      'puntosTotales': 0,
      'totalActividades': 0,
    });

    await HomeWidget.saveWidgetData<String>(_widgetDataKey, emptyData);
    await HomeWidget.updateWidget(
      name: 'WeeklyProgressWidget',
      androidName: 'WeeklyProgressWidget',
    );
  }

  static Future<void> _updateWidgetWithErrorState() async {
    final errorData = jsonEncode({
      'estado': 'error',
      'mensaje': 'Error al cargar datos',
      'progresoTotal': 0,
      'puntosTotales': 0,
      'totalActividades': 0,
    });

    await HomeWidget.saveWidgetData<String>(_widgetDataKey, errorData);
    await HomeWidget.updateWidget(
      name: 'WeeklyProgressWidget',
      androidName: 'WeeklyProgressWidget',
    );
  }

  static void _handleWidgetClick(Uri? uri) {
    if (uri != null) {
      final action = uri.queryParameters['action'];

      switch (action) {
        case 'open_app':
          break;
        case 'show_progress':
          _showProgressNotification();
          break;
        case 'refresh':
          updateWidgetData();
          break;
      }
    }
  }

  static Future<void> _showProgressNotification() async {
    final isarService = IsarService();
    final resumen = await isarService.obtenerResumenSemanal();

    if (resumen != null) {
      final notificationService = NotificationService();
      await notificationService.showWeeklyProgress(
        completedActivities: resumen['actividadesCompletadas'] ?? 0,
        totalActivities: resumen['totalActividades'] ?? 0,
        totalPoints: resumen['puntosTotales'] ?? 0,
      );
    }
  }
}
