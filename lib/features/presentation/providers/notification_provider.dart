import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettings {
  final bool dailyReminders;
  final bool dailySecReminders;
  final int dailyReminderHour;
  final int dailyReminderMinute;
  final int dailySecReminderHour;
  final int dailySecReminderMinute;
  final bool weeklyStartReminders;
  final bool weeklyEndReminders;
  final bool activityReminders;
  final bool completionNotifications;
  final bool progressNotifications;

  const NotificationSettings({
    this.dailyReminders = true,
    this.dailySecReminders = true,
    this.dailyReminderHour = 9,
    this.dailyReminderMinute = 0,
    this.dailySecReminderHour = 18,
    this.dailySecReminderMinute = 0,
    this.weeklyStartReminders = true,
    this.weeklyEndReminders = true,
    this.activityReminders = true,
    this.completionNotifications = true,
    this.progressNotifications = true,
  });

  NotificationSettings copyWith({
    bool? dailyReminders,
    bool? dailySecReminders,
    int? dailyReminderHour,
    int? dailyReminderMinute,
    int? dailySecReminderHour,
    int? dailySecReminderMinute,
    bool? weeklyStartReminders,
    bool? weeklyEndReminders,
    bool? activityReminders,
    bool? completionNotifications,
    bool? progressNotifications,
  }) {
    return NotificationSettings(
      dailyReminders: dailyReminders ?? this.dailyReminders,
      dailySecReminders: dailySecReminders ?? this.dailySecReminders,
      dailyReminderHour: dailyReminderHour ?? this.dailyReminderHour,
      dailyReminderMinute: dailyReminderMinute ?? this.dailyReminderMinute,
      dailySecReminderHour: dailySecReminderHour ?? this.dailySecReminderHour,
      dailySecReminderMinute:
          dailySecReminderMinute ?? this.dailySecReminderMinute,
      weeklyStartReminders: weeklyStartReminders ?? this.weeklyStartReminders,
      weeklyEndReminders: weeklyEndReminders ?? this.weeklyEndReminders,
      activityReminders: activityReminders ?? this.activityReminders,
      completionNotifications:
          completionNotifications ?? this.completionNotifications,
      progressNotifications:
          progressNotifications ?? this.progressNotifications,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyReminders': dailyReminders,
      'dailySecReminders': dailySecReminders,
      'dailyReminderHour': dailyReminderHour,
      'dailyReminderMinute': dailyReminderMinute,
      'dailySecReminderHour': dailySecReminderHour,
      'dailySecReminderMinute': dailySecReminderMinute,
      'weeklyStartReminders': weeklyStartReminders,
      'weeklyEndReminders': weeklyEndReminders,
      'activityReminders': activityReminders,
      'completionNotifications': completionNotifications,
      'progressNotifications': progressNotifications,
    };
  }

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      dailyReminders: json['dailyReminders'] ?? true,
      dailySecReminders: json['dailySecReminders'] ?? true,
      dailyReminderHour: json['dailyReminderHour'] ?? 9,
      dailyReminderMinute: json['dailyReminderMinute'] ?? 0,
      dailySecReminderHour: json['dailySecReminderHour'] ?? 9,
      dailySecReminderMinute: json['dailySecReminderMinute'] ?? 0,
      weeklyStartReminders: json['weeklyStartReminders'] ?? true,
      weeklyEndReminders: json['weeklyEndReminders'] ?? true,
      activityReminders: json['activityReminders'] ?? true,
      completionNotifications: json['completionNotifications'] ?? true,
      progressNotifications: json['progressNotifications'] ?? true,
    );
  }
}

class NotificationSettingsNotifier extends StateNotifier<NotificationSettings> {
  NotificationSettingsNotifier() : super(const NotificationSettings()) {
    _loadSettings();
  }

  static const String _storageKey = 'notification_settings';

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    if (jsonString != null) {
      final Map<String, dynamic> json = {};
      final pairs = jsonString
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split(',');
      for (final pair in pairs) {
        final keyValue = pair.split(':');
        if (keyValue.length == 2) {
          final key = keyValue[0].trim().replaceAll('"', '');
          final value = keyValue[1].trim();

          if (value == 'true') {
            json[key] = true;
          } else if (value == 'false') {
            json[key] = false;
          } else if (int.tryParse(value) != null) {
            json[key] = int.parse(value);
          }
        }
      }
      state = NotificationSettings.fromJson(json);
    }
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final json = state.toJson();
    final jsonString =
        '{'
        '"dailyReminders":${json['dailyReminders']},'
        '"dailySecReminders":${json['dailySecReminders']},'
        '"dailyReminderHour":${json['dailyReminderHour']},'
        '"dailyReminderMinute":${json['dailyReminderMinute']},'
        '"dailySecReminderHour":${json['dailySecReminderHour']},'
        '"dailySecReminderMinute":${json['dailySecReminderMinute']},'
        '"weeklyStartReminders":${json['weeklyStartReminders']},'
        '"weeklyEndReminders":${json['weeklyEndReminders']},'
        '"activityReminders":${json['activityReminders']},'
        '"completionNotifications":${json['completionNotifications']},'
        '"progressNotifications":${json['progressNotifications']}'
        '}';

    await prefs.setString(_storageKey, jsonString);
  }

  void updateDailyReminders(bool enabled) {
    state = state.copyWith(dailyReminders: enabled);
    _saveSettings();
  }

  void updateDailySecReminders(bool enabled) {
    state = state.copyWith(dailySecReminders: enabled);
    _saveSettings();
  }

  void updateDailyReminderTime(int hour, int minute) {
    state = state.copyWith(
      dailyReminderHour: hour,
      dailyReminderMinute: minute,
    );
    _saveSettings();
  }

  void updateDailySecReminderTime(int hour, int minute) {
    state = state.copyWith(
      dailySecReminderHour: hour,
      dailySecReminderMinute: minute,
    );
    _saveSettings();
  }

  void updateWeeklyStartReminders(bool enabled) {
    state = state.copyWith(weeklyStartReminders: enabled);
    _saveSettings();
  }

  void updateWeeklyEndReminders(bool enabled) {
    state = state.copyWith(weeklyEndReminders: enabled);
    _saveSettings();
  }

  void updateActivityReminders(bool enabled) {
    state = state.copyWith(activityReminders: enabled);
    _saveSettings();
  }

  void updateCompletionNotifications(bool enabled) {
    state = state.copyWith(completionNotifications: enabled);
    _saveSettings();
  }

  void updateProgressNotifications(bool enabled) {
    state = state.copyWith(progressNotifications: enabled);
    _saveSettings();
  }

  void resetToDefaults() {
    state = const NotificationSettings();
    _saveSettings();
  }
}

final notificationSettingsProvider =
    StateNotifierProvider<NotificationSettingsNotifier, NotificationSettings>(
      (ref) => NotificationSettingsNotifier(),
    );
