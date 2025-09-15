import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/services/notification_service.dart';
import 'package:isar_app/features/presentation/providers/notification_provider.dart';

class NotificationsSettingsScreen extends ConsumerStatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  ConsumerState<NotificationsSettingsScreen> createState() =>
      _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
    extends ConsumerState<NotificationsSettingsScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final enabled = await _notificationService.areNotificationsEnabled();
    if (!enabled) {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permisos de Notificaciones'),
        content: const Text(
          'Para recibir recordatorios útiles, necesitamos tu permiso para enviar notificaciones.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _notificationService.requestPermissions();
            },
            child: const Text('Permitir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(notificationSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionHeader('Recordatorios Diarios'),
            _buildSwitchTile(
              title: 'Recordatorio diario',
              subtitle: 'Recibe un recordatorio para revisar tus actividades',
              value: settings.dailyReminders,
              onChanged: (value) {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .updateDailyReminders(value);
                if (value) {
                  _notificationService.scheduleDailyReminder(
                    hour: settings.dailyReminderHour,
                    minute: settings.dailyReminderMinute,
                  );
                } else {
                  _notificationService.cancelNotification(1000);
                }
              },
            ),

            if (settings.dailyReminders) ...[
              _buildTimeTile(
                title: 'Hora del recordatorio diario',
                subtitle: 'Selecciona cuando quieres recibir el recordatorio',
                time: TimeOfDay(
                  hour: settings.dailyReminderHour,
                  minute: settings.dailyReminderMinute,
                ),
                onChanged: (time) {
                  ref
                      .read(notificationSettingsProvider.notifier)
                      .updateDailyReminderTime(time.hour, time.minute);
                  _notificationService.scheduleDailyReminder(
                    hour: time.hour,
                    minute: time.minute,
                  );
                },
              ),
            ],

            const SizedBox(height: 12),

            _buildSwitchTile(
              title: 'Segundo Recordatorio diario',
              subtitle:
                  'Puedes recibir un segundo recordatorio para revisar tus actividades',
              value: settings.dailySecReminders,
              onChanged: (value) {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .updateDailySecReminders(value);
                if (value) {
                  _notificationService.scheduleDailyReminder(
                    hour: settings.dailySecReminderHour,
                    minute: settings.dailySecReminderMinute,
                    title: '¿Estas libre un momento? ⏰',
                  );
                } else {
                  _notificationService.cancelNotification(1000);
                }
              },
            ),

            if (settings.dailySecReminders) ...[
              _buildTimeTile(
                title: 'Hora del recordatorio diario',
                subtitle: 'Selecciona cuando quieres recibir el recordatorio',
                time: TimeOfDay(
                  hour: settings.dailySecReminderHour,
                  minute: settings.dailySecReminderMinute,
                ),
                onChanged: (time) {
                  ref
                      .read(notificationSettingsProvider.notifier)
                      .updateDailySecReminderTime(time.hour, time.minute);
                  _notificationService.scheduleDailyReminder(
                    hour: time.hour,
                    minute: time.minute,
                    title: '¿Estas libre un momento? ⏰',
                  );
                },
              ),
            ],

            const SizedBox(height: 24),

            _buildSectionHeader('Recordatorios Semanales'),
            _buildSwitchTile(
              title: 'Inicio de semana',
              subtitle: 'Recordatorio para planificar tu semana (Lunes - 8:00 am)',
              value: settings.weeklyStartReminders,
              onChanged: (value) {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .updateWeeklyStartReminders(value);
                if (value) {
                  _notificationService.scheduleWeeklyStartReminder();
                } else {
                  _notificationService.cancelNotification(2000);
                }
              },
            ),

            _buildSwitchTile(
              title: 'Fin de semana',
              subtitle: 'Recordatorio para revisar tu progreso (Domingo - 9:00 pm)',
              value: settings.weeklyEndReminders,
              onChanged: (value) {
                ref
                    .read(notificationSettingsProvider.notifier)
                    .updateWeeklyEndReminders(value);
                if (value) {
                  _notificationService.scheduleWeeklyEndReminder();
                } else {
                  _notificationService.cancelNotification(3000);
                }
              },
            ),

            const SizedBox(height: 24),

            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SwitchListTile.adaptive(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue.shade600,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildTimeTile({
    required String title,
    required String subtitle,
    required TimeOfDay time,
    required ValueChanged<TimeOfDay> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time.format(context),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: time,
          );
          if (picked != null) {
            onChanged(picked);
          }
        },
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {
              await _notificationService.showWeeklyProgress(
                completedActivities: 5,
                totalActivities: 10,
                totalPoints: 150,
              );

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Notificación inmediata enviada!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            icon: const Icon(Icons.send),
            label: const Text('Notificación Inmediata'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.green.shade400),
              foregroundColor: Colors.green.shade600,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cancelar Notificaciones'),
                  content: const Text(
                    '¿Estás seguro de que quieres cancelar todas las notificaciones programadas?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Sí'),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await _notificationService.cancelAllNotifications();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Todas las notificaciones han sido canceladas',
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  );
                }
              }
            },
            icon: const Icon(Icons.cancel),
            label: const Text('Cancelar Todas'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.orange.shade400),
              foregroundColor: Colors.orange.shade600,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
