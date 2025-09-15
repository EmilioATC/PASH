import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/services/notification_service.dart';

class ActividadCard extends ConsumerStatefulWidget {
  final Actividad actividad;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onComplete;

  const ActividadCard({
    super.key,
    required this.actividad,
    this.onEdit,
    this.onDelete,
    this.onComplete,
  });

  @override
  ConsumerState<ActividadCard> createState() => _ActividadCardState();
}

class _ActividadCardState extends ConsumerState<ActividadCard> {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: widget.onEdit,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con título y estado
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.actividad.nombre,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildEstadoChip(),
                  _buildNotificationIndicator(),
                ],
              ),

              const SizedBox(height: 8),

              // Descripción
              if (widget.actividad.descripcion.isNotEmpty) ...[
                Text(
                  widget.actividad.descripcion,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Información de progreso
              Row(
                children: [
                  Icon(
                    Icons.repeat,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.actividad.repeticionesCompletadas}/${widget.actividad.repeticiones}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.actividad.valor}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Información de notificaciones
              if (widget.actividad.notificacionesHabilitadas) ...[
                _buildNotificationInfo(),
                const SizedBox(height: 12),
              ],

              // Barra de progreso
              LinearProgressIndicator(
                value: widget.actividad.repeticiones > 0
                    ? widget.actividad.repeticionesCompletadas / widget.actividad.repeticiones
                    : 0,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(),
                ),
              ),

              const SizedBox(height: 12),

              // Botones de acción
              Row(
                children: [
                  if (widget.onComplete != null &&
                      widget.actividad.estado != EstadoActividad.completado) ...[
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _marcarComoCompletada,
                        icon: const Icon(Icons.check, size: 16),
                        label: const Text('Completar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],

                  // Botón de notificaciones
                  IconButton(
                    onPressed: _toggleNotificaciones,
                    icon: Icon(
                      widget.actividad.notificacionesHabilitadas
                          ? Icons.notifications_active
                          : Icons.notifications_off,
                      color: widget.actividad.notificacionesHabilitadas
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    tooltip: widget.actividad.notificacionesHabilitadas
                        ? 'Desactivar notificaciones'
                        : 'Activar notificaciones',
                  ),

                  // Botón de editar
                  if (widget.onEdit != null) ...[
                    IconButton(
                      onPressed: widget.onEdit,
                      icon: const Icon(Icons.edit),
                      tooltip: 'Editar actividad',
                    ),
                  ],

                  // Botón de eliminar
                  if (widget.onDelete != null) ...[
                    IconButton(
                      onPressed: _confirmarEliminar,
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Eliminar actividad',
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEstadoChip() {
    Color color;
    String texto;

    switch (widget.actividad.estado) {
      case EstadoActividad.pendiente:
        color = Colors.orange;
        texto = 'Pendiente';
        break;
      case EstadoActividad.enProgreso:
        color = Colors.blue;
        texto = 'En progreso';
        break;
      case EstadoActividad.completado:
        color = Colors.green;
        texto = 'Completado';
        break;
      case EstadoActividad.cancelado:
        color = Colors.red;
        texto = 'Cancelado';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNotificationIndicator() {
    if (!widget.actividad.notificacionesHabilitadas) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(26),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.notifications,
        size: 16,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildNotificationInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.schedule,
            size: 16,
            color: Colors.blue,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _getNotificationDescription(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getNotificationDescription() {
    if (!widget.actividad.notificacionesHabilitadas) {
      return 'Sin notificaciones';
    }

    switch (widget.actividad.frecuenciaNotificacion) {
      case FrecuenciaNotificacion.unica:
        if (widget.actividad.fechaNotificacion != null && widget.actividad.horaNotificacion != null) {
          final fecha = widget.actividad.fechaNotificacion!;
          final hora = widget.actividad.horaNotificacion!;
          return 'Una vez: ${fecha.day}/${fecha.month}/${fecha.year} ${hora.format(context)}';
        }
        return 'Una vez (sin configurar)';

      case FrecuenciaNotificacion.diaria:
        if (widget.actividad.horaNotificacionDiaria != null) {
          return 'Diariamente a las ${widget.actividad.horaNotificacionDiaria!.format(context)}';
        }
        return 'Diariamente (sin hora)';

      case FrecuenciaNotificacion.semanal:
        if (widget.actividad.diaSemanaNotificacion != null && widget.actividad.horaNotificacionSemanal != null) {
          final diaNombre = _getDiaSemanaNombreCompleto(widget.actividad.diaSemanaNotificacion!);
          return 'Semanalmente los $diaNombre a las ${widget.actividad.horaNotificacionSemanal!.format(context)}';
        }
        return 'Semanalmente (sin configurar)';

      case FrecuenciaNotificacion.personalizada:
        if (widget.actividad.diasNotificacionPersonalizada.isNotEmpty && widget.actividad.horaNotificacionPersonalizada != null) {
          final diasNombres = widget.actividad.diasNotificacionPersonalizada
              .map((dia) => _getDiaSemanaNombreCorto(dia))
              .join(', ');
          return 'Días: $diasNombres a las ${widget.actividad.horaNotificacionPersonalizada!.format(context)}';
        }
        return 'Días personalizados (sin configurar)';
    }
  }

  String _getDiaSemanaNombreCompleto(int dia) {
    switch (dia) {
      case 1: return 'Lunes';
      case 2: return 'Martes';
      case 3: return 'Miércoles';
      case 4: return 'Jueves';
      case 5: return 'Viernes';
      case 6: return 'Sábado';
      case 7: return 'Domingo';
      default: return '';
    }
  }

  String _getDiaSemanaNombreCorto(int dia) {
    switch (dia) {
      case 1: return 'Lun';
      case 2: return 'Mar';
      case 3: return 'Mié';
      case 4: return 'Jue';
      case 5: return 'Vie';
      case 6: return 'Sáb';
      case 7: return 'Dom';
      default: return '';
    }
  }

  Color _getProgressColor() {
    final progreso = widget.actividad.repeticiones > 0
        ? widget.actividad.repeticionesCompletadas / widget.actividad.repeticiones
        : 0;

    if (progreso >= 1.0) return Colors.green;
    if (progreso >= 0.5) return Colors.orange;
    return Colors.blue;
  }

  Future<void> _marcarComoCompletada() async {
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }

  Future<void> _toggleNotificaciones() async {
    try {
      if (widget.actividad.notificacionesHabilitadas) {
        // Desactivar notificaciones
        await _notificationService.cancelActivityNotification(widget.actividad);
        widget.actividad.notificacionesHabilitadas = false;
        widget.actividad.idNotificacionProgramada = null;
      } else {
        // Activar notificaciones con configuración por defecto
        widget.actividad.notificacionesHabilitadas = true;
        widget.actividad.frecuenciaNotificacion = FrecuenciaNotificacion.diaria;
        widget.actividad.setHoraNotificacionDiaria(TimeOfDay.now());

        await _notificationService.scheduleRecurringActivityNotification(widget.actividad);
      }

      // Aquí deberías guardar los cambios en la base de datos
      // await isarService.actualizarActividad(widget.actividad);

      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.actividad.notificacionesHabilitadas
                  ? 'Notificaciones activadas'
                  : 'Notificaciones desactivadas',
            ),
            backgroundColor: widget.actividad.notificacionesHabilitadas
                ? Colors.green
                : Colors.orange,
          ),
        );
      }
    } catch (e) {
      print('Error toggling notifications: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al cambiar configuración de notificaciones'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _confirmarEliminar() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Actividad'),
        content: Text(
          '¿Estás seguro de que quieres eliminar "${widget.actividad.nombre}"?\n\n'
          'Esta acción también cancelará todas las notificaciones programadas.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmar == true && widget.onDelete != null) {
      // Cancelar notificaciones antes de eliminar
      try {
        await _notificationService.cancelActivityNotification(widget.actividad);
      } catch (e) {
        print('Error cancelling notifications before deletion: $e');
      }

      widget.onDelete!();
    }
  }
}